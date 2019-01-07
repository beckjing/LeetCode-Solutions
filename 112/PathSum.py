#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/1/8 00:02
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : PathSum
# @Software: PyCharm

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def hasPathSum(self, root, sum):
        """
        :type root: TreeNode
        :type sum: int
        :rtype: bool
        """
        if root == None:
            return False
        leftResult = False
        if root.left != None:
            leftResult = self.hasPathSum(root.left, sum - root.val)
        rightResult = False
        if root.right != None:
            rightResult = self.hasPathSum(root.right, sum - root.val)
        if root.left == None and root.right == None:
            return root.val == sum
        return leftResult or rightResult

    def printTree(self, root):
        print(root.value)
        if root.left != None:
            self.printTree(root.left)
        if root.right != None:
            self.printTree(root.right)
