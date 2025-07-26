void main(){
  print('passo 1');
  print('passo 2');
  print('passo 3');
  print('passo 4');
  print('passo 5');
  print('passo 6');
  print('passo 7');
  print('passo 8');
  print('passo 9');
  print('passo 10');

  // for
  for(int passo = 1; passo <= 10; passo++){
    print('passo $passo');
  }


 for(int passo = 10; passo >= 1; passo--){
    print('passo $passo');
  }

// while
int i = 1;
while(i <= 10){
  print(i);
  i++;
}

print(i);

// do while
i = 0;
do{
  print('do while $i');
  i++;
}while(i <= 10);
  
}