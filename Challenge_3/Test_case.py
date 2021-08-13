
"""

Created on Friday, Aug 13, 2021

@Author: Chinmaya Palo

"""
import unittest
import json
from Recursive import find_by_key


class TestFindByKey(unittest.TestCase):

    def test_find_by_key(self):
        f = open("test_data1.json")
        data = json.load(f)
        key = 'x/y/z'
        res = ''.join(list(find_by_key(data, key)))
        print('value = ' + res)
        self.assertAlmostEqual(res, 'a')
        f.close()

        f = open("test_data2.json")
        data = json.load(f)
        key = 'a/b/c'
        res = ''.join(list(find_by_key(data, key)))
        print('value = ' + res)
        self.assertAlmostEqual(res, 'd')
        f.close()


p1 = TestFindByKey()
p1.test_find_by_key()