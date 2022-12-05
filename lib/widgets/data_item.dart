import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem(this.entry, this.value, {Key? key}) : super(key: key);

  final String entry;
  final int value;
  @override

  //这其实是一个用来显示寄存器信息的组件
  //下面的leading是寄存器名称
  //trailing是寄存器的值
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(entry),
        trailing: Text(value.toRadixString(16)),
      ),
    );
  }
}
