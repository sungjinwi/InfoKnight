// @ (1) (2) 에 알맞는 답

package control_statement.java10;

public class Test {
	public static void main(String []args) {
		int ary[][] = new int[( ① )][( ② )];
		int n = 1;
		for(int i = 0; i < 3; i++) {
			for(int j = 0; j < 5; j++) {
				ary[i][j] = j * 3 + i + 1;
				System.out.print(ary[i][j] + " ");
			}
			System.out.println();
		}
	}
}
