import numpy as np
import json
import os


class AttributesGenerator(object):
    def __init__(self, attr_config_file_path, sample_number=10):
        with open(attr_config_file_path, 'r') as f:
            self.attr_config_dict = json.load(f)

        self.dataset = []

        for i in range(sample_number):
            self.dataset.append(self.generate_one_sample(attr_config_dict=self.attr_config_dict))

    @staticmethod
    def _generate_categorical_attributes(val_list, weight=None):
        res = np.random.choice(np.array(val_list), p=weight)
        return int(res)

    @staticmethod
    def _generate_continuous_attributes(range, mean=None, std=None):
        if not mean:
            return float(np.random.uniform(low=range[0], high=range[1]))
        else:
            return float(np.clip(np.random.normal(loc=mean, scale=std), a_min=range[0], a_max=range[1]))

    @staticmethod
    def _generate_ordinal_attributes(range, step, weight=None):
        range = np.arange(range[0], range[1], step=step)
        res = np.random.choice(range, p=weight)
        return int(res)

    @staticmethod
    def generate_one_sample(attr_config_dict):
        sample_dict = {}
        for key, val in attr_config_dict.items():
            if val['TYPE'] == 'CONTINUOUS':
                mean = val['MEAN'] if "MEAN" in val else None
                std = val['STD'] if "STD" in val else None
                res = AttributesGenerator._generate_continuous_attributes(range=list(val['RANGE']),
                                                                          mean=mean,
                                                                          std=std)

            elif val['TYPE'] == 'ORDINAL':
                weight = val['WEIGHT'] if 'WEIGHT' in val else None
                res = AttributesGenerator._generate_ordinal_attributes(range=val['RANGE'],
                                                                       step=val['STEP'],
                                                                       weight=weight)

            elif val['TYPE'] == 'CATEGORICAL':
                weight = val['WEIGHT'] if 'WEIGHT' in val else None
                res = AttributesGenerator._generate_categorical_attributes(val_list=list(val['VALUE']),
                                                                           weight=weight)

            else:
                raise ValueError
            sample_dict[key] = res
        return sample_dict


if __name__ == '__main__':
    from dataset import DATASET_PATH
    a = AttributesGenerator(attr_config_file_path=os.path.join(DATASET_PATH, 'attributes.json'))
    print(json.dumps(a.dataset, indent=4, sort_keys=True))
