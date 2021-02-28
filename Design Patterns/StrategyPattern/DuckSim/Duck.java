class Duck{
    FlyBehavior flyBehavior;
    QuackBehavior quackBehavior;

    public void name(){}

    public void setFlyBehavior(FlyBehavior flyBehavior){
        this.flyBehavior = flyBehavior;
    }

    public void setQuackBehavior(QuackBehavior quackBehavior){
        this.quackBehavior = quackBehavior;   
    }

    public void fly(){
        flyBehavior.fly();
    }

    public void quack(){
        quackBehavior.quack();
    }

}