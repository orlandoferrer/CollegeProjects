/* matrix implementation using arrays TEST */

#include <iostream>
using namespace std;

int main(){
    
    int size=3;
    int array1[]={1,2,3,4,5,6,7,8,9};
    int array2[]={9,8,7,6,5,4,3,2,1};
    int res[]={0,0,0,0,0,0,0,0,0};
    int temp=0;
    
    
    for (int i=0; i<size*size; i++){
           
        for (int j=0; j<size*size;j++ ){
            temp=0;
            
            for (int k=0; k<size*size;k++ ){
            
                temp+= (array1[j] * array2[k+size]);  
                         
                  cout << temp << "\t";  
                  //res[k+j]=temp;                
                 
            }
            
           
            j++;
            
          }
        }
        
        cout << "\n" << "Res Array: \n";
    /*for (int i=0; i<size*size; i++)
        cout << res[i] << "\t";
        
        cout << "\n";   */
        
    system("pause");
return 0;
}
