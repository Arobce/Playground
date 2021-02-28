class DuckSim{
    public static void main(String[] args){
        Duck mallardDuck = new MallardDuck();
        
        mallardDuck.name();
        
        mallardDuck.setFlyBehavior(new FlyWithWings());
        mallardDuck.setQuackBehavior(new Quack());

        mallardDuck.fly(); 
        mallardDuck.quack();
    }
}