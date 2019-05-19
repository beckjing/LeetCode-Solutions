#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-05-20 00:03
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : TwoSum
# @Software: PyCharm

from typing import List

# class Solution:
#     def twoSum(self, nums: List[int], target: int) -> List[int]:
#         for i in range(0, len(nums)):
#             for j in range(i + 1, len(nums)):
#                 if nums[i] + nums[j] == target:
#                     return [i, j]

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        dic = {}
        for i in range(0, len(nums)):
            print(dic)
            if dic.get(nums[i]) is not None:
                return [dic[nums[i]], i]
            else:
                dic[target - nums[i]] = i

sol = Solution()
print(sol.twoSum([2, 7, 11, 15], 9))