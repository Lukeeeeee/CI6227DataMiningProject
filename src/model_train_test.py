from catboost import CatBoostClassifier
from dataset import DATASET_PATH
from src.generate_attributes import load_json, export_json
import numpy as np
import os
from log import LOG_PATH


class Classifier(object):
    attr_key_list = [
        "AGE",
        "AVE_ASSISTANCE",
        "AVE_FOUL",
        "AVE_SCORE",
        "AVE_STEALING",
        "AVE_TACKLING",
        "HEIGHT",
        "NATION",
        "SAVING_TIME",
        "SPEED",
        "WEIGHT",
        "YELLOW_RED_CARD_NUMBER"
    ]

    def __init__(self, dataset_file_path, test_dataset_file_path, dataset_split_ratio=0.7, train_iter=10, depth=10,
                 learing_rate=0.1,
                 loss='MultiClass', logging_level='Verbose'):
        self.dataset = load_json(file_path=dataset_file_path)
        dataset_num = len(self.dataset)

        self.train_set = self.dataset[:int(dataset_num * dataset_split_ratio)]
        self.validate_set = self.dataset[int(dataset_num * dataset_split_ratio):]

        self.test_set = load_json(file_path=test_dataset_file_path)
        self.train_attr_set, self.train_label_set = self._process_dataset(dataset=self.train_set)
        self.validate_attr_set, self.validate_label_set = self._process_dataset(dataset=self.validate_set)
        self.test_attr_set, self.test_label_set = self._process_dataset(dataset=self.test_set)
        self.model = CatBoostClassifier(iterations=train_iter,
                                        depth=depth,
                                        cat_features=[7],
                                        loss_function=loss,
                                        learning_rate=learing_rate,
                                        logging_level=logging_level)
        self.config = {}
        self.config['LEARNING_RATE'] = learing_rate
        self.config['LOSS'] = loss
        self.config['DEPTH'] = depth
        self.config['TRAIN_DATASET_COUNT'] = len(self.train_label_set)
        self.config['VALIDATE_DATASET_COUNT'] = len(self.validate_label_set)
        self.config['TEST_DATASET_COUNT'] = len(self.test_label_set)
        self.final_test_acc = 0.0
        self.feature_res = {}

    def train(self):
        self.model.fit(X=self.train_attr_set,
                       y=self.train_label_set,
                       eval_set=(self.validate_attr_set, self.validate_label_set))

    def test(self):
        res = self.model.predict(self.test_attr_set)
        # print(res)
        acc = np.sum([1 if res[i] == self.test_label_set[i] else 0 for i in range(len(self.test_label_set))]) / len(
            self.test_attr_set)
        print("accuracy is %f" % acc)
        self.final_test_acc = acc

    def feature_importance(self):
        res = self.model.get_feature_importance()

        for score, key in zip(res, Classifier.attr_key_list):
            print("%s %f" % (key, score))
            self.feature_res[key] = score

    @staticmethod
    def _process_dataset(dataset):
        attr_set = []
        label_set = []
        for sample in dataset:
            attr = []
            for key in Classifier.attr_key_list:
                attr.append(sample[key])
            label = sample['LABEL']
            attr_set.append(attr)
            label_set.append(label)
        return np.array(attr_set), np.array(label_set)

    def export_res(self, path='', file_name='exp_log.json'):
        res = {}
        res['EXP_CONFIG'] = self.config
        res['FEATURE_IMPORTANCE'] = self.feature_res
        res['FINAL_TEST_ACCURACY'] = self.final_test_acc
        export_json(file_path=os.path.join(LOG_PATH, path, file_name), dict=res)
        pass


if __name__ == '__main__':
    lr = [0.01, 0.03, 0.1, 0.3]
    depth = [1, 2, 3, 4, 6, 8, 10, 12, 14]
    train_iter = [10, 50, 100, 300, 500]
    for de in depth:
        a = Classifier(dataset_file_path=os.path.join(DATASET_PATH, '1000_dataset', 'attr_label_dataset.json'),
                       test_dataset_file_path=os.path.join(DATASET_PATH, 'test_dataset', 'attr_label_dataset.json'),
                       train_iter=100,
                       depth=de,
                       learing_rate=0.1)
        a.train()
        a.feature_importance()
        a.test()
        a.export_res(path='1000_dataset', file_name='depth_%d' % de)
