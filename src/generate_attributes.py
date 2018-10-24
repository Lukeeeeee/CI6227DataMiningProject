import numpy as np
import json
import os


def load_json(file_path):
    with open(file_path, 'r') as f:
        return json.load(f)


def export_json(file_path, dict):
    with open(file_path, 'w') as f:
        json.dump(dict, f, indent=4, sort_keys=True)


class AttributesGenerator(object):
    def __init__(self, attr_config_file_path, sample_number=10):

        self.attr_config_dict = load_json(file_path=attr_config_file_path)

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
    def _generate_save_time(range, step):
        assert range[0] == 0
        range = np.arange(range[0], range[1], step=step)
        min_val = range[0]
        max_val = range[-1]
        zero_prob = np.random.rand()
        if zero_prob < 0.8:
            return 0
        else:
            res = int(np.clip(np.random.normal(loc=(max_val + min_val) / 2.0, scale=1.0),
                              a_min=min_val,
                              a_max=max_val))
            return res

    @staticmethod
    def generate_one_sample(attr_config_dict):
        sample_dict = {}
        for key, val in attr_config_dict.items():
            if key == 'SAVING_TIME':
                res = AttributesGenerator._generate_save_time(range=list(val['RANGE']),
                                                              step=1)
            else:
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

    a = AttributesGenerator(attr_config_file_path=os.path.join(DATASET_PATH, 'attributes_config.json'),
                            sample_number=10000)
    export_json(file_path=os.path.join(DATASET_PATH, 'attr_dataset.json'), dict=a.dataset)
