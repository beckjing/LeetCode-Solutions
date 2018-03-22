#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/22/18 4:23 PM
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : ValidNumber.py
# @Software: PyCharm


class Solution(object):

    def isNumber(self, s):
        """
        :type s: str
        :rtype: bool
        """
        status_start_space = 1
        status_start_number_without_dot = 2
        status_start_number_with_dot = 3
        status_dot_after_number = 4
        status_dot_before_number = 5
        status_e = 6
        status_end_number_with_dot = 7
        status_end_number_with_e = 8
        status_end_space = 9
        status_symbol_before_e = 10
        status_symbol_after_e = 11
        status_not_number = 12
        # input_space input_number input_dot input_e input_symbol
        transtionMatrix = [
            status_start_space, status_start_number_without_dot, status_dot_before_number, status_not_number, status_symbol_before_e,  # status = 0
            status_start_space, status_start_number_without_dot, status_dot_before_number, status_not_number, status_symbol_before_e,  # status_start_space
            status_end_space,   status_start_number_without_dot, status_dot_after_number,  status_e,          status_not_number,  # status_start_number_without_dot
            status_end_space,   status_start_number_with_dot,    status_not_number,        status_e,          status_not_number,  # status_start_number_with_dot
            status_end_space,   status_end_number_with_dot,      status_not_number,        status_e,          status_not_number,  # status_dot_after_number
            status_not_number,  status_start_number_with_dot,    status_not_number,        status_not_number, status_not_number,  # status_dot_before_number
            status_not_number,  status_end_number_with_e,        status_not_number,        status_not_number, status_symbol_after_e,  # status_e
            status_end_space,   status_end_number_with_dot,      status_not_number,        status_e,          status_not_number,  # status_end_number_with_dot
            status_end_space,   status_end_number_with_e,        status_not_number,        status_not_number, status_not_number,  # status_end_number_with_e
            status_end_space,   status_not_number,               status_not_number,        status_not_number, status_not_number,  # status_end_space
            status_not_number,  status_start_number_without_dot, status_dot_before_number, status_not_number, status_not_number,  # status_symbol_before_e
            status_not_number,  status_end_number_with_e,        status_not_number,        status_not_number, status_not_number,  # status_symbol_after_e
        ]
        current_status = 0
        for i in range(0, len(s)):
            input_type = self.inputType(s[i])
            if input_type == 5:  # input_other
                return False
            current_status = transtionMatrix[current_status * 5 + input_type]
            if current_status == status_not_number:
                return False
        if current_status == status_start_number_without_dot or \
                current_status == status_start_number_with_dot or \
                current_status == status_end_number_with_dot or \
                current_status == status_end_number_with_e or \
                current_status == status_end_space or \
                current_status == status_dot_after_number:
            return True
        return False


    def inputType(self, char):
        input_space = 0
        input_number = 1
        input_dot = 2
        input_e = 3
        input_symbol = 4
        input_other = 5
        if char == ' ':
            return input_space
        elif char == '.':
            return input_dot
        elif char == 'e':
            return input_e
        elif '0' <= char <= '9':
            return input_number
        elif char == '-' or char == '+':
            return input_symbol
        else:
            return input_other

