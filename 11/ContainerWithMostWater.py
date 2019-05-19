#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/1/6 10:45
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : ContainerWithMostWater
# @Software: PyCharm

class Solution:
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        result = 0
        leftIndex = 0
        rightIndex = len(height) - 1
        leftHeight = height[leftIndex]
        rightHeight = height[rightIndex]
        while leftIndex < rightIndex:
            if leftHeight > rightHeight:
                if result < (rightHeight * (rightIndex - leftIndex)):
                    result = (rightHeight * (rightIndex - leftIndex))
                rightIndex -= 1
                rightHeight = height[rightIndex]
            else:
                if result < (leftHeight * (rightIndex - leftIndex)):
                    result = (leftHeight * (rightIndex - leftIndex))
                leftIndex += 1
                leftHeight = height[leftIndex]
        return result
            
            
        

if __name__ == '__main__':
    test = Solution()
    print(test.maxArea([1,8,6,2,5,4,8,3,7]))

