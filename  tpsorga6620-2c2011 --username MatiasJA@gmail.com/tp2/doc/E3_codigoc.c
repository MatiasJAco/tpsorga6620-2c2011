int a = 0;
int i = 0;

for(i = 0; i < 10; ++i){
	if( i % 2 ){
		a += i;
	}
	
	if( a > 11){
		break;
	}
}