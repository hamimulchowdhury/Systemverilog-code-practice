class card;
  rand enum {Heart,Spade,Club,Diamond} suit;
 rand bit [3:0] rank;
 
 constraint C_rank {
 	rank inside {[1:13]};
 }
endclass
 
class deck ;
	rand card cards[52];
 
	function new ();
		foreach (cards[i])
			cards[i] = new;
	endfunction
 
 
  constraint D {
    cards.sum with (item.suit == card::Heart   ? 1: 0 ) == 13;
    cards.sum with (item.suit == card::Spade   ? 1: 0 ) == 13;
    cards.sum with (item.suit == card::Club    ? 1: 0 ) == 13;
    cards.sum with (item.suit == card::Diamond ? 1: 0 ) == 13;
 
  }
  constraint E {
    foreach(cards[i])foreach(cards[j]){(cards[i].suit==cards[j].suit&& i!=j) -> cards[i].rank != cards[j].rank;}

 }
 
  	
 
endclass
 
module test;
        deck shuffle;
        initial begin
          shuffle = new;
          assert (shuffle.randomize());
          foreach(shuffle.cards[i])
 $display("User%0d:%s%0d",i%4+1,shuffle.cards[i].suit,shuffle.cards[i].rank);
        end
endmodule