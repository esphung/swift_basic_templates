


// import libraries
import Foundation;





// declare variables
var current_order_cost_raw_value:Float;// cost of order before tax
var current_sales_tax_decimal_value:Float;// sales tax percentage as decimal
var sales_tax_dollar_amount:Float;
var amount_tendered_cash_value:Float;
var total_cost_after_tax_value:Float;
var change_amount_due:Float;





// initialize variables
current_order_cost_raw_value = 0.0;
current_sales_tax_decimal_value = 0.0;
sales_tax_dollar_amount = 0.0;
amount_tendered_cash_value = 0.0;
total_cost_after_tax_value = 0.0;
change_amount_due = 0.0;






// function definitions

func displayCurrentVariables(){
	/* this function will console log all current variables */

	print("\n")

	print("Current Total:\t\t$\t"+String.localizedStringWithFormat("%.2f",current_order_cost_raw_value));
	print("Sales Tax Percent:\t\t"+String.localizedStringWithFormat("%.01f",current_sales_tax_decimal_value*100.0));
	print("Tax Amount Owed:\t$\t"+String.localizedStringWithFormat("%.02f",sales_tax_dollar_amount));
	print("Cash tendered:\t\t$\t" + String.localizedStringWithFormat("%.2f",amount_tendered_cash_value));
	print("Total After Tax:\t$\t"+String.localizedStringWithFormat("%.2f", total_cost_after_tax_value));
	print("Change Amount Due:\t$\t"+String.localizedStringWithFormat("%.2f", change_amount_due))

	print("\n")

}// end display variable definition


func calculateChangeDueAmount(cost:Float,cash:Float) -> Float {
	/* calculate how much money to give back to customer */
	var change:Float = 0.0;

	if (total_cost_after_tax_value > 0) {
		change = cash - cost;
	}

	return change;
}// end calculate change amount definition

func calculateSalesTaxDollarAmount(cost:Float,tax_rate:Float) -> Float {
	var num = Float();
	num = cost * tax_rate;
	return num;

}// end get dollar amount of tax definition


func calculateCostAfterSalesTax(cost:Float,tax_rate:Float)->Float{
	/* Here is where sales tax and order cost is calculated into a final cost */
	var num = Float();
	num = cost * tax_rate;
	num = cost + num;

	return num;
}// end calculation of sales tax definition


func isEnoughCashTendered() -> Bool {
	if (current_order_cost_raw_value <= amount_tendered_cash_value) {
		return true;
	} else {
		return false;
	}
	}// end check for enough cash given definition


func main() -> Void {
	/* one function to call them all :D */

	// test values
	current_order_cost_raw_value = 26.54;
	current_sales_tax_decimal_value = 0.07;
	amount_tendered_cash_value = 32.01;

	if (isEnoughCashTendered() == true) {

		// perform calculations

		sales_tax_dollar_amount = calculateSalesTaxDollarAmount(
			current_order_cost_raw_value,
			tax_rate:current_sales_tax_decimal_value
			);



		total_cost_after_tax_value = calculateCostAfterSalesTax(
			current_order_cost_raw_value,
			tax_rate:current_sales_tax_decimal_value
			);

		change_amount_due = calculateChangeDueAmount(
			total_cost_after_tax_value,
			cash:amount_tendered_cash_value
			);



	}// end if to check cash tendered is enough
	else {
		print("Not enough cash tendered")
		return;
	}




	displayCurrentVariables();


}// end main definitions



// call to main
main()




