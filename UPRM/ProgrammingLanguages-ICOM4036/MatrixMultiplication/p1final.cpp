/*
					Matrix Multiplication
#*****************    		ICOM 4036   		*****************#
#*****************			Sec. 156   	 		*****************#
#*****************  Rafael Vega #802-01-8317	*****************#
#*****************  Orlando Ferrer #802-01-2321 *****************#
*/


#include <iostream>
#define SIZE 3
using namespace std;

//const int size=3;

void multiply(int mat1[], int mat2[], int res[], int size)
{

     int off1=0;
     int off2=0;
     for(int h=1; h<=size*size; h++){
             int temp=0;
             for(int i=0; i<size; i++){
                     temp+=mat1[i+off1]*mat2[off2+i*size];
             }
             off2++;
             res[h-1]=temp;
             if(off2==size){
                           off1+=size;
                           off2=0;
             }
     }

}

int main(){


int mat1[SIZE*SIZE]={1,2,3,4,5,6,7,8,9};
int mat2[SIZE*SIZE]={9,8,7,6,5,4,3,2,1};
int res[SIZE*SIZE]={0};


multiply(mat1, mat2, res, SIZE);

for(int i=0; i<SIZE*SIZE; i++){
	cout << res[i] << " " << endl;

}


return 0;
}







