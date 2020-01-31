package com.hjlee.home;

class Knife implements Weapon {

  public void useWeapon() {
    System.out.println("Use Knife");
  }
}

class Gun implements Weapon {

  public void useWeapon() {
    System.out.println("Use Gun");
  }
}

class Spike implements Weapon {

  public void useWeapon() {
    System.out.println("Use Spike");
  }
}

interface Weapon {

  void useWeapon();
}

class Player {

  private Weapon weapon;

  Player() {
  }

  public void setWeapon(Weapon weapon) {
    this.weapon = weapon;
  }

  public void usePlayerWeapon() {
    weapon.useWeapon();
  }
}

public class Main {

  public static void main(String[] args) {
    // TODO Auto-generated method stub
    Player player = new Player();

    player.setWeapon(new Gun());
    player.usePlayerWeapon();

    player.setWeapon(new Spike());
    player.usePlayerWeapon();

    player.setWeapon(new Knife());
    player.usePlayerWeapon();
  }
}