import numpy as np
import json
import os
from src.generate_attributes import export_json, load_json
from dataset import DATASET_PATH


class LabelGenerator(object):
    def __init__(self, attr_dataset, label_config_file_path):
        self.attr_dataset = attr_dataset
        self.label_config = load_json(file_path=label_config_file_path)
        self.final_dataset = []

    def process_data(self):
        for sample in self.attr_dataset:
            label, new_sample = self._compute_label_with_one_sample(sample=sample)
            self.final_dataset.append(new_sample)
        export_json(file_path=os.path.join(DATASET_PATH, 'attr_label_dataset.json'), dict=self.final_dataset)

    def _compute_label_with_one_sample(self, sample):
        # Compute each attribute's contribution to each label,
        # Suppose we have m attributes, and n labels,
        # So we use a m x n matrix to
        # compute the sum contribution over all attributes of one sample w.r.t. each label
        # The label with maximum value will be the ground truth of this sample
        label_score_list = np.zeros(len(self.label_config['CLASS_DICT']))
        for key, val in sample.items():
            res = np.array(self.label_config['CLASS_WEIGHT_WITH_ATTR'][key], dtype=np.float32) * val
            label_score_list += res
        label = np.argmax(label_score_list)
        sample['LABEL'] = int(label)
        for key, val in self.label_config['CLASS_DICT'].items():
            if val == label:
                sample['LABEL_NAME'] = key
        # TODO
        # add random noise for label
        return label, sample


if __name__ == '__main__':
    a = LabelGenerator(attr_dataset=load_json(file_path=os.path.join(DATASET_PATH, 'attr_dataset.json')),
                       label_config_file_path=os.path.join(DATASET_PATH, 'label_config.json'))
    a.process_data()
