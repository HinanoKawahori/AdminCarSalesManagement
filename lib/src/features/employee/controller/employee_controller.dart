import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../data_model/employee.dart';
import '../repo/employee_repo.dart';

part 'employee_controller.g.dart'; // Changed file name to employee_controller.g.dart

@riverpod
class EmployeeController extends _$EmployeeController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

//employee追加
  Future<void> addEmployee({
    required Employee employee,
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required Timestamp birthDate,
    required int role,
  }) async {
    state = const AsyncLoading();
    final newEmployee = Employee(
      employeeId: Uuid().v4(),
      employeeName: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      birthDate: birthDate,
      role: role,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    );
    await ref
        .read(employeeRepoProvider.notifier)
        .addEmployee(employee: newEmployee);
    state = const AsyncData(null);
  }

// employee更新
  Future<void> updateEmployee({
    required Employee employee,
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required Timestamp birthDate,
    required int role,
  }) async {
    state = const AsyncLoading();
    final updatedEmployee = employee.copyWith(
      updatedAt: Timestamp.now(),
    );

    await ref.read(employeeRepoProvider.notifier).updateEmployee(
          employee: updatedEmployee,
        );
    state = const AsyncData(null);
  }

//全てのemployeeを取得
  Future<List<Employee>> getAllEmployeeList() async {
    state = const AsyncLoading();
    final userDataList =
        await ref.read(employeeRepoProvider.notifier).getAllEmployeeList();
    state = const AsyncData(null);
    return userDataList;
  }

  //employee1件取得
  Future<Employee> getEmployeeData({
    required String employeeId,
  }) async {
    state = const AsyncLoading();
    final employee = await ref
        .read(employeeRepoProvider.notifier)
        .getEmployeeData(employeeId: employeeId);
    state = const AsyncData(null);
    return employee;
  }

//TODO 名前検索
  List<Employee> searchEmployee({
    required List<Employee> employeeList,
    required TextEditingController searchController,
  }) {
    return employeeList.where(
      (employee) {
        return employee.employeeName.contains(searchController.text);
      },
    ).toList();
  }
}

//employee1件監視
@riverpod
Stream<Employee?> watchEmployeeDataController(
  WatchEmployeeDataControllerRef ref, {
  required String employeeId,
}) {
  return ref
      .read(employeeRepoProvider.notifier)
      .watchEmployeeData(employeeId: employeeId);
}

//limit付きですべてのemployee監視
@riverpod
Stream<List<Employee>> watchAllEmployeeDataController(
    WatchAllEmployeeDataControllerRef ref) {
  final limit = ref.watch(employeeLimitControllerProvider);
  return ref.read(employeeRepoProvider.notifier).watchAllEmployee(limit);
}

//TODO 特別措置
@riverpod
class EmployeeLimitController extends _$EmployeeLimitController {
  @override
  int build() {
    return 10;
  }

  void increment() {
    state = state + 10;
  }
}
