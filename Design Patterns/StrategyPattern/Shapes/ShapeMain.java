class ShapeMain{

    public static void main(String[] args){
        Shape square = new Shape();
        square.setAreaType(new SquareArea(new ShapeProperties(20,0,0)));
        System.out.println(square.getArea());

        CircularShape circle = new CircularShape();
        ShapeProperties circleProperties = new ShapeProperties();
        circleProperties.setRadius(20.0);
        circle.setCircumferenceType(new CircleCircumference(circleProperties));
        System.out.println(circle.getCircumference());
    }


}