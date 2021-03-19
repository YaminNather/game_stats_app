import 'package:flutter/material.dart';

class GunData {
  GunData(this.mname, this.mweaponType, this.mammoType, this.mweaponStats);

  Color fgetColorFromGunData() {
    switch(mammoType) {
      case AmmoTypes.Light: return Colors.brown;
      case AmmoTypes.Heavy: return Colors.blue[400];
      case AmmoTypes.Energy: return Colors.green;
      case AmmoTypes.Shotgun: return Colors.red;
      case AmmoTypes.Sniper: return Colors.blue[800];
      default: return Colors.pink;  
    }
  }

  String fgetGunImageURI() {
    String gunName = mname.toLowerCase().replaceAll(" ", "-");
    
    return "lib/pages/test-page-1/gun-images/$gunName.png";
  }
  
  String fgetAmmoTypeIconURI() {
    String lfaddToDirectoryPath(String name) {
      return "lib/pages/test-page-1/ammo-types-icons/$name.png";
    }

    switch(mammoType) {
      case AmmoTypes.Light: return lfaddToDirectoryPath("light");
      case AmmoTypes.Heavy: return lfaddToDirectoryPath("heavy");
      case AmmoTypes.Energy: return lfaddToDirectoryPath("energy");
      case AmmoTypes.Shotgun: return lfaddToDirectoryPath("shotgun");
      case AmmoTypes.Sniper: return lfaddToDirectoryPath("sniper");
    }

    return "";
  }

  String fgetAmmoTypeAsString() {
    switch(mammoType) {
      case AmmoTypes.Light: return "Light";
      case AmmoTypes.Heavy: return "Heavy";
      case AmmoTypes.Energy: return "Energy";
      case AmmoTypes.Shotgun: return "Shotgun";
      case AmmoTypes.Sniper: return "Sniper";      
    }

    return "";
  }

  String fgetWeaponTypeAsString() {
    switch(mweaponType) {
      case WeaponTypes.AssaultRifle: return "Assault Rifle";
      case WeaponTypes.SubmachineGun: return "Submachine Gun";
      case WeaponTypes.Shotgun: return "Shotgun";
      case WeaponTypes.Sniper: return "Sniper";
      case WeaponTypes.Pistol: return "Pistol";
      case WeaponTypes.LightMachineGun: return "Light Machine Gun";
    }

    return "WeaponType";
  }

  final String mname;
  final WeaponTypes mweaponType;
  final AmmoTypes mammoType;  
  final WeaponStats mweaponStats;  
}

class WeaponStats {
  WeaponStats(
    this.mttk, this.mdps, this.mfireRate, this.mmagSize, this.mreloadDuration,
    this.mdamageInfo
  );

  final double mttk;
  final double mdps;
  final double mfireRate;
  final int mmagSize;
  final double mreloadDuration;
  final DamageInfo mdamageInfo;
}

class DamageInfo {
  DamageInfo(
    this.mupperTorso, this.mlowerTorso, this.mupperLimbs, this.mlowerLimbs, 
    this.mhead
  );

  final int mupperTorso;
  final int mlowerTorso;
  final int mupperLimbs;
  final int mlowerLimbs;
  final int mhead;
}

enum WeaponTypes { SubmachineGun, AssaultRifle, Shotgun, LightMachineGun, Sniper, Pistol }

enum AmmoTypes { Light, Heavy, Energy, Shotgun, Sniper }