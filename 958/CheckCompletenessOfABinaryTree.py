#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-05-24 22:47
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : CheckCompletenessOfABinaryTree
# @Software: PyCharm

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def isCompleteTree(self, root: TreeNode) -> bool:
        currentNode = [root]
        nextLevelNode = []
        hasMiss = False
        while len(currentNode) > 0:
            for node in currentNode:
                if hasMiss:
                    if node.left is not None or node.right is not None:
                        return False
                if node.left is not None:
                    if node.right is not None:
                        nextLevelNode.append(node.left)
                        nextLevelNode.append(node.right)
                    else:
                        hasMiss = True
                else:
                    hasMiss = True
            currentNode = nextLevelNode
        return True