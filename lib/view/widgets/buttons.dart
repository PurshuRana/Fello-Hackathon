//Author: Purushotham
//Created On: 09-12-2023

import 'package:flutter/material.dart';

enum _FelloButtonsType { text, icon, textIcon, elevated, elevatedIcon }

class FelloButton extends StatelessWidget {
  const FelloButton({super.key,required this.label,this.onPressed}): type = _FelloButtonsType.elevated, icon= null,
        assert(label != null, "Text cannot be null");
  const FelloButton.icon({super.key,required this.icon,this.onPressed}): type = _FelloButtonsType.icon, label= null, assert(icon != null, "Icon cannot be null");
  const FelloButton.textIcon({super.key,required this.label,required this.icon,this.onPressed}): type = _FelloButtonsType.textIcon, assert(icon != null && label != null, "Icon and text cannot be null");
  const FelloButton.elevatedIcon({super.key,required this.label,required this.icon,this.onPressed}): type = _FelloButtonsType.elevatedIcon, assert(icon != null && label != null, "Icon and text cannot be null");
  const FelloButton.text({super.key,required this.label,this.onPressed}): type = _FelloButtonsType.elevatedIcon, icon = null,  assert( label != null, "Text cannot be null");
  // ignore: library_private_types_in_public_api
  final _FelloButtonsType type;
  final VoidCallback? onPressed;
  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      _FelloButtonsType.text => TextButton(onPressed: onPressed, child: Text(label!)),
    
      _FelloButtonsType.icon => IconButton(onPressed: onPressed, icon: Icon(icon!)),
      
      _FelloButtonsType.textIcon => TextButton.icon(onPressed: onPressed, icon: Icon(icon!), label: Text(label!)),
      
      _FelloButtonsType.elevated => ElevatedButton(onPressed: onPressed, child: Text(label!)),
    
      _FelloButtonsType.elevatedIcon => ElevatedButton.icon(onPressed: onPressed, icon: Icon(icon!), label: Text(label!)),
    };
  }
}

