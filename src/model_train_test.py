from catboost import CatBoostClassifier
from dataset import DATASET_PATH
from src.generate_attributes import load_json, export_json
import numpy as np
import os


class Classifier(object):

    def __init__(self, dataset_file_path, dataset_split_ration=0.8, train_iter=10, depth=10, learing_rate=0.1,
                 loss='MultiClass', logging_level='Verbose'):
        self.dataset = load_json(file_path=dataset_file_path)
        dataset_num = len(self.dataset)
        self.train_set = self.dataset[:int(dataset_num * dataset_split_ration)]
        self.test_set = self.dataset[int(dataset_num * dataset_split_ration):]
        self.train_attr_set, self.train_label_set = self._process_dataset(dataset=self.train_set)
        self.test_attr_set, self.test_label_set = self._process_dataset(dataset=self.test_set)
        self.model = CatBoostClassifier(iterations=train_iter,
                                        depth=depth,
                                        loss_function=loss,
                                        learning_rate=learing_rate,
                                        logging_level=logging_level)

    def train(self):
        self.model.fit(X=self.train_attr_set,
                       y=self.train_label_set)

    def test(self):
        res = self.model.predict(self.test_attr_set)
        print(res)
        acc = np.sum([1 if res[i] == self.test_label_set[i] else 0 for i in range(len(self.test_label_set))]) /\
              len(self.test_attr_set)
        print("accuracy is %f" % acc)

    def feature_importance(self):
        pass

    @staticmethod
    def _process_dataset(dataset):
        attr_set = []
        label_set = []
        for sample in dataset:
            attr = []
            label = None
            for key, val in sample.items():
                if 'LABEL' not in key:
                    attr.append(val)
                elif key == 'LABEL':
                    label = val
            attr_set.append(attr)
            label_set.append(label)
        return np.array(attr_set), np.array(label_set)


if __name__ == '__main__':
   a = Classifier(dataset_file_path=os.path.join(DATASET_PATH, 'attr_label_dataset.json'), train_iter=70)
   a.train()
   a.test()
