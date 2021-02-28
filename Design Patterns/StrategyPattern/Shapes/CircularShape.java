public class CircularShape{
    Circumference circumType;

    public void setCircumferenceType(Circumference circumference){
        this.circumType = circumference;
    }

    public double getCircumference(){
        return circumType.getCircumference();
    }
}