import "package:game_stats_app/models/apex-legends/gun-data.dart";

class GunsDatas {
  static Map<String, GunData> smgunsDatas = {
    "R99" : new GunData(
      "R99", WeaponTypes.SubmachineGun, AmmoTypes.Light, 
      new WeaponStats(1.0, 2.0, 2.0, 2, 2.0)
    ),
    "R301" : new GunData(
      "R301", WeaponTypes.AssaultRifle, AmmoTypes.Light, 
      new WeaponStats(1.0, 2.0, 2.0, 2, 2.0)
    ),
    "Volt" : new GunData(
      "Volt", WeaponTypes.SubmachineGun, AmmoTypes.Energy, 
      new WeaponStats(1.0, 2.0, 2.0, 2, 2.0)
    ),
    "Alternator" : new GunData(
      "Alternator", WeaponTypes.Pistol, AmmoTypes.Light, 
      new WeaponStats(1.0, 2.0, 2.0, 2, 2.0)
    ),
    "Havoc" : new GunData(
      "Havoc", WeaponTypes.AssaultRifle, AmmoTypes.Energy, 
      new WeaponStats(1.0, 2.0, 2.0, 2, 2.0)
    ),
    "Sentinel" : new GunData(
      "Sentinel", WeaponTypes.Sniper, AmmoTypes.Sniper,
       new WeaponStats(1.0, 2.0, 2.0, 2, 2.0)
    )
  };

  static List<GunData> sfgetGunsDatasAsList() {
    List<GunData> r = [];
    smgunsDatas.forEach( (key, value) => r.add(value) );

    return r;
  }
}