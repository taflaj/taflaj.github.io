// example1.java

import java.util.Random;

public class Example1 {

    public static double calculate(int iterations) {
        Random random = new Random();
        long inside = 0;

        for (int i = 0; i < iterations; i++) {
            double x = random.nextDouble();
            double y = random.nextDouble();

            if (x * x + y * y <= 1) {
                inside++;
            }
        }

        return (4.0 * inside) / iterations;
    }

    public static void main(String[] args) {
        int iterations = 100_000_000;
        System.out.printf(
            "Estimated value of π: %.10f%n",
            calculate(iterations)
        );
    }
}
