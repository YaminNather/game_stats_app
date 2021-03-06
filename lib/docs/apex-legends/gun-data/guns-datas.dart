import "package:game_stats_app/models/apex-legends/gun-data.dart";

class GunsDatas {
  static Map<String, GunData> smgunsDatas = {
    "R99" : new GunData(
      "R99", WeaponTypes.SubmachineGun, AmmoTypes.Light, 
      new WeaponStats(
        1.0, 2.0, 2.0, 2, 2.0, new DamageInfo(20, 20, 18, 15, 104)
      )
    ),
    "R301" : new GunData(
      "R301", WeaponTypes.AssaultRifle, AmmoTypes.Light, 
      new WeaponStats(
        1.0, 2.0, 2.0, 2, 2.0, new DamageInfo(20, 20, 18, 15, 104)
      )
    ),
    "Volt" : new GunData(
      "Volt", WeaponTypes.SubmachineGun, AmmoTypes.Energy, 
      new WeaponStats(
        1.0, 2.0, 2.0, 2, 2.0, new DamageInfo(20, 20, 18, 15, 104)
      )
    ),
    "Alternator" : new GunData(
      "Alternator", WeaponTypes.Pistol, AmmoTypes.Light, 
      new WeaponStats(
        1.0, 2.0, 2.0, 2, 2.0, new DamageInfo(20, 20, 18, 15, 104)
      )
    ),
    "Havoc" : new GunData(
      "Havoc", WeaponTypes.AssaultRifle, AmmoTypes.Energy, 
      new WeaponStats(
        1.0, 2.0, 2.0, 2, 2.0, new DamageInfo(20, 20, 18, 15, 104)
      )
    ),
    "Sentinel" : new GunData(
      "Sentinel", WeaponTypes.Sniper, AmmoTypes.Sniper,
       new WeaponStats(
        1.0, 2.0, 2.0, 2, 2.0, new DamageInfo(20, 20, 18, 15, 104)
      )
    )
  };

  static List<GunData> sfgetGunsDatasAsList() {
    List<GunData> r = [];
    smgunsDatas.forEach( (key, value) => r.add(value) );

    return r;
  }
}