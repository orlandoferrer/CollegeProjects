/* matrix implementation using arrays TEST */

#include <iostream>
using namespace std;

int main(){
    
    int size=2;
    int array1[]={1,2,3,4};
    int array2[]={4,3,2,1};
    int res[]={0,0,0,0};
    int temp=0;
    
    
    //for (int i=0; i<size*size; i++){
           
        for (int j=0; j<size*size; ){
            for (int k=0; k<size; k++){
           
               temp= (array1[j] * array2[k]) +
                        (array1[j+1] * array2[k+size]) ;  
                         
               //   cout << temp << "\t";  
                  res[k+j]=temp;                
                 
            }
            
           
            j+=2;
            
          }
      //  }
        
        cout << "\n" << "Res Array: \n";
    for (int i=0; i<size*size; i++)
        cout << res[i] << "\t";
        
        cout << "\n";   
        
    system("pause");
return 0;
}
