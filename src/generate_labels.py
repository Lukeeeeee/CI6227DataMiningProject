import numpy as np
import json
import os
from src.generate_attributes import export_json, load_json
from dataset import DATASET_PATH


class LabelGenerator(object):
    def __init__(self, attr_dataset, label_config_file_path, attr_config_file_path):
        self.attr_dataset = attr_dataset
        self.label_config = load_json(file_path=label_config_file_path)
        self.attr_config = load_json(file_path=attr_config_file_path)
        self.final_dataset = []
        self.label_count = {}

    def process_data(self):
        for sample in self.attr_dataset:
            label, new_sample, key = self._compute_label_with_one_sample(sample=sample)
            if not new_sample:
                continue
            if key not in self.label_count:
                self.label_count[key] = 1
            else:
                self.label_count[key] += 1
            self.final_dataset.append(new_sample)
        export_json(file_path=os.path.join(DATASET_PATH, 'attr_label_dataset.json'), dict=self.final_dataset)
        export_json(file_path=os.path.join(DATASET_PATH, 'label_stat.json'), dict=self.label_count)

    def _compute_label_with_one_sample(self, sample):
        # Compute each attribute's contribution to each label,
        # Suppose we have m attributes, and n labels,
        # So we use a m x n matrix to
        # compute the sum contribution over all attributes of one sample w.r.t. each label
        # The label with maximum value will be the ground truth of this sample
        # TODO treat some continuous label to be categorical
        label_score_list = np.zeros(len(self.label_config['CLASS_DICT']))
        for key, val in sample.items():
            if self.attr_config[key]['TYPE'] == 'CATEGORICAL':
                normalized_val = val
            else:
                normalized_val = (val - self.attr_config[key]['RANGE'][0]) / \
                                 (self.attr_config[key]['RANGE'][1] - self.attr_config[key]['RANGE'][0])
            if key == 'HEIGHT':
                res = self._compute_score_for_height(val=normalized_val)
            else:
                res = np.array(self.label_config['CLASS_WEIGHT_WITH_ATTR'][key], dtype=np.float32) * normalized_val
            label_score_list += res
        label = np.argmax(label_score_list)
        if ((label_score_list[label] - np.mean(label_score_list)) / np.mean(label_score_list)) < 0.2:
            return None, None, None
        else:
            sample['LABEL'] = int(label)
            for key, val in self.label_config['CLASS_DICT'].items():
                if val == label:
                    sample['LABEL_NAME'] = key
            return label, sample, sample['LABEL_NAME']

    def _compute_score_for_height(self, val):
        # normalized height = [0, 1], if height in [0.0 - 0.5] then we set score for 4 labels as [0, 0, 1, 1]
        # if height in (0.5-1.0] then we set score for 4 labels as [1, 1, 0, 0]
        if val > 0.5:
            return np.array([1, 1, 0, 0], dtype=np.float)
        else:
            return np.array([0, 0, 1, 1], dtype=np.float)


if __name__ == '__main__':
    a = LabelGenerator(attr_dataset=load_json(file_path=os.path.join(DATASET_PATH, 'attr_dataset.json')),
                       label_config_file_path=os.path.join(DATASET_PATH, 'label_config.json'),
                       attr_config_file_path=os.path.join(DATASET_PATH, 'attributes_config.json'))
    a.process_data()
