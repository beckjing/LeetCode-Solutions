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
        currentNode = [root]  # 当前这层的节点
        nextLevelNode = []  # 下一层的节点
        hasMiss = False  # 是否有节点为空
        while len(currentNode) > 0:
            for node in currentNode:
                print(node.val)
                if hasMiss:
                    # 如果已经遍历到空节点
                    if node.left is not None or node.right is not None:
                        # 当前节点还有子节点，则不是完全二叉树
                        return False
                if node.left is not None:
                    nextLevelNode.append(node.left)
                    if node.right is not None:
                        nextLevelNode.append(node.right)
                    else:
                        # 已经有节点为空
                        hasMiss = True
                else:
                    # 已经有节点为空
                    if node.right is not None:
                        # 在左子节点为空的情况下还有右节点，则不是完全二叉树
                        return False
                    hasMiss = True
            if hasMiss:
                for nextNode in nextLevelNode:
                    if nextNode.left is not None or nextNode.right is not None:
                        # 在已经有空的情况下，还有下一层的节点，则不是完全二叉树
                        return False
            currentNode = nextLevelNode
            nextLevelNode = []
        return True


class BestSolution(object):
    def isCompleteTree(self, root):
        nodes = [(root, 1)]
        i = 0
        while i < len(nodes):
            node, v = nodes[i]
            i += 1
            if node:
                nodes.append((node.left, 2 * v))
                nodes.append((node.right, 2 * v + 1))
        return nodes[-1][1] == len(nodes)
