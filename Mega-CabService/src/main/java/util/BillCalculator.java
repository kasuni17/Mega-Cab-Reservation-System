package util;

public class BillCalculator {

    private static final double BASE_FARE = 5000.0; // Base fare for the ride
    private static final double PER_PASSENGER_CHARGE = 1000.0; // Charge per passenger
    private static final double PER_LUGGAGE_CHARGE = 1500.0; // Charge per luggage
    private static final double TAX_RATE = 0.1; // 10% tax
    private static final double DISCOUNT_RATE = 0.05; // 5% discount

    public static double calculateTotalBill(int passengerCount, int luggageCount) {
        double totalFare = BASE_FARE + (passengerCount * PER_PASSENGER_CHARGE) + (luggageCount * PER_LUGGAGE_CHARGE);
        double discount = totalFare * DISCOUNT_RATE;
        double fareAfterDiscount = totalFare - discount;
        double tax = fareAfterDiscount * TAX_RATE;
        return fareAfterDiscount + tax;
    }
}