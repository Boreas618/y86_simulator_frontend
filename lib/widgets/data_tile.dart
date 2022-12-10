import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  const DataTile(this.entry, this.value, this.type, this.isToBeChanged,
      {Key? key})
      : super(key: key);

  final String entry;
  final String value;
  final TileType type;
  final bool isToBeChanged;

  @override
  //这其实是一个用来显示寄存器信息的组件
  //下面的leading是寄存器名称
  //trailing是寄存器的值
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          entry,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          value,
          style: TextStyle(color: isToBeChanged ? Colors.red : Colors.black),
        ),
      ),
    );
  }
}

enum TileType { Hex, Regular }
