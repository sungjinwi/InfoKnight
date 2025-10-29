// @ 괄호 안에 들어갈 답


package java_example.java5;

class Car implements Runnable {
	int a;

	public void run() {
		try {
			while (++a < 100) {
				System.out.println("miles traveled : " + a);
				Thread.sleep(100);
			}
		} catch (Exception E) {System.out.println(E.getMessage());}
	}
}

public class Test {
	public static void main(String args[]) {
		Thread t1 = new Thread(new (****)());
		t1.start();
	}
}

