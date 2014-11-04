#include "ai.h"
#include <iostream>
#include <fstream>
#include <list>
#include <cstdlib>
#include <cstdio>
#include <string>
#include <conio.h>
ai::ai()
{
    //ctor
}

ai::~ai()
{
    //dtor
}


using namespace std;
int MapX,MapY;

//typedef int map[5][6];
int x,y,p,q,f,g,h,i,s,t;
int tempe = -1;
int tempr = -1;
/*
string tempstr1;
string tempstr2;

 string concat (string A1, string A2){
    return A1+A2;
    }
//Connection *connection = new Bluetooth();
*/
list<char*> orlist;

struct Struktur{

int A[7][7];
int O[7][7];
};

Struktur S;


//Mencari nilai heuristik dari tiap koordinat.
//Dengan masukan koordinat open list dan titik target.
//Menghitung jaraknya, dan mengeluarkan output nilai heuristik
int Heuristic(int m,int n,int u, int v)
{
    int temp1=0;
    int temp2=0;
    int H=0;

            if (u<m){
            temp1 = u;
            u = m;
            m = temp1; }


            if (v<n){
            temp2 = v;
            v = n;
            n = temp2; }


            H = ((u-m)+(v-n))*10;
           // PrintMatrix2(*S.O, 30);
            cout<<endl;

            return H;




}
//Mencari nilai minimum dari semua koordinat
int  Min(int *C, int l){

 int   temp = 999;
                for (s=0; s<MapX; s++)
                {

                    for (t=0; t<MapY; t++)
                    {



            if ((S.A[s][t] % 10 == 0) &&(S.A[s][t]>0) && (S.A[s][t] < temp))
            {
            temp = S.A[s][t];

                }


                    }
                }

                return temp;
}



int  Min2(int *C, int l){
int   tempo = 999;

                for (s=0; s<MapX; s++)
                {

                    for (t=0; t<MapY; t++)
                    {
            if ((S.O[s][t] % 10 == 0) &&(S.O[s][t]>0) && (S.O[s][t] < tempo))
            {
            tempo = S.O[s][t];

                }
                    }
                }
               // cout<<tempo<<endl;
                return tempo;
}



//((tempe - e == 0) && (tempr - r == 1 ))


int GoPathfinding(int F[7][7])
{
    ai *ob[7][7];
    MapX = 7;
    MapY = 7;
    int X,Y,P,Q,Pe,Qe;
    X=0;
    Y=0;
    P=0;
    Q=0;
//connection->connect(40);

//Buat Matriks(array 2 dimensi) dimensi beserta kontentnya yang berisi
//, start, target, walkable, dan unwalkable.


//Assigned Special Value.Start=15, Goal=25, Closed List=5, Unwalkable=35
//titik referensi = 45
  S.A =
        {{0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0}};

F[7][7] = S.A[7][7];


//Mengeluarkan output untuk matrix pertama kali

//Titik awal lokasi robot = titik referensi
    for (x=0; x<MapX; x++)
    {

        for (y=0; y<MapY; y++)
        {
            if (S.A[x][y] == 15)
            {S.A[x][y] = 45;
                X = x;
                Y = y;
            }
        }
    }










//Pathfinding dimulai.
Mulai:


    for (x=0; x<MapX; x++)
    {
        for (y=0; y<MapY; y++)
        {
//Cari Titik Target di Matrix, Bila ditemukan:
            if (S.A[x][y] == 25)
                { goto KotakTetangga;
                }

        }
    }






                KotakTetangga:
                for (p=0; p<MapX; p++)
                {

                    for (q=0; q<MapY; q++)
                    {
  //Cari Titik Referensi di Matrix, Bila ditemukan:
                        if (S.A[p][q] == 45)
                        {
                            //set Titik Referensi menjadi closed list
                             S.A[p][q] = 5;
//Masukkan tetangga-tetangga dari titik referensi (atas, bawah, kanan,
//kiri kedalam open list.
                             //Cari Nilai heuristik TR kiri
  //Lainnya, Jika tetangga = unwalkable/closed list/titik referensi, hiraukan.
                        if ((S.A[p][q-1]!=45)&& ((q-1) >= 0 ) &&
                            (S.A[p][q-1]!=35)&&(S.A[p][q-1]!=5)){

                             S.A[p][q-1]=Heuristic(p,(q-1),x,y);
  //Jika titik target masuk kedalam closed list, maka path telah ditemukan.
                             if (S.A[p][q-1]==0){
                                    P = p;

                                    Q = q-1;
                                     Pe= p;
                                    Qe = q-1;
                                    //S.A[p][q-1]=5;

                                   //orlist.push_back ("<");
                                    //cout<<"Path Telah Ditemukan"<<endl;

                                    goto Selesai;
                             }

                             }

//PrintMatrix(*S.A, 30);

                            //Cari Nilai heuristik TR atas
                        if ((S.A[p-1][q]!=45)&& ((p-1) >= 0) &&
                            (S.A[p-1][q]!=35)&&(S.A[p-1][q]!=5)){

                             S.A[p-1][q]=Heuristic((p-1),q,x,y);
                             if ( S.A[p-1][q]==0) {
                                 P = p-1;
                                 Q = q;
                                 Pe= p-1;
                                 Qe = q;
                                //S.A[p-1][q]=5;

                                 //orlist.push_back ("^");
                                 //cout<<"Path Telah Ditemukan"<<endl;
                                    goto Selesai;}
                             }
//PrintMatrix(*S.A, 30);

                            //Cari Nilai heuristik TR kanan
                        if ((S.A[p][q+1]!=45)&&
                            (S.A[p][q+1]!=35)&&(S.A[p][q+1]!=5)){
                             S.A[p][q+1]=Heuristic(p,(q+1),x,y);

                             if ( S.A[p][q+1]== 0) {
                                 P = p;
                                 Q = q+1;
                                 Pe= p;
                                 Qe = q+1;
                                 //S.A[p][q+1]= 5;

                                 //orlist.push_back (">");
                                 //cout<<"Path Telah Ditemukan"<<endl;
                                goto Selesai;
                             }
                             }
//PrintMatrix(*S.A, 30);
                            //Cari Nilai heuristik TR bawah
                        if ((S.A[p+1][q]!=45)&&
                            (S.A[p+1][q]!=35)&&(S.A[p+1][q]!=5)){
                             S.A[p+1][q]=Heuristic((p+1),q,x,y);
                                if ( S.A[p+1][q]== 0){
                                    P = p+1;
                                    Q = q;
                                    Pe= p+1;
                                    Qe = q;
                                    // S.A[p+1][q]= 5;

                                     //orlist.push_back ("v");
                                     //cout<<"Path Telah Ditemukan"<<endl;
                                goto Selesai;
                                }
                             }



//PrintMatrix(*S.A, 30);
                        }
                    }
                }
//Mencari Nilai terkecil dan menjadikannya titik referensi


                for (f=0; f<MapX; f++){
                for (g=0; g<MapY; g++)
                {
                    if (S.A[f][g] == Min(*S.A, (MapX*MapY)) )
                    {
                     S.A[f][g]=45;
                     //UpdateSO(f, g);
                     goto Mulai;}
                                    }
                            }



Selesai:

/*
//Jika Failed, fungsi tidak dijalankan.
            for (h=0; h<MapX; h++){
                for (i=0; i<MapY; i++)
                { if (S.A[h][i] == 25 )



                }
            }

//PrintMatrix(*S.A, 30);
*/


//Hilangkan semua penghalang dan open list, sehingga hanya closed list
//yang tersisa
cout<<"Cek"<<endl;
 for (x=0; x<MapX; x++)
    {

        for (y=0; y<MapY; y++)
        { if (S.A[x][y] != 5) S.A[x][y] = 0;}
    }
 //PrintMatrix(*S.A, 30);



//cout<<X<<Y<<P<<Q<<endl;

//Inisialisasi matriks baru untuk konfirmasi, dan akan menjadi path list
            S.O = {{0,0,0,0,0,0},
                 {0,0,0,0,0,0},
                 {0,0,0,0,0,0},
                 {0,0,0,0,0,0},
                 {0,0,0,0,0,0}};

    Start:
//Working Backwards. Konfirmasi ulang dengan melakukan pathfinding dari
//target ke start.

     S.O[P][Q] = 999;
     if ((S.A[P][Q-1] == 5) && ((Q-1) >= 0)) {S.O[P][Q-1] = Heuristic(P, (Q-1), X, Y);}
        if ((P == X) && ((Q-1) == Y)) {goto End;}

         if ((S.A[P-1][Q] == 5) && ((P-1) >= 0)) {S.O[P-1][Q] = Heuristic((P-1), Q, X, Y);}
         if (((P-1) == X) && (Q == Y)) {goto End;}

         if ((S.A[P][Q+1] == 5) && ((Q+1) <= 5)) {S.O[P][Q+1] = Heuristic(P, (Q+1), X, Y);}
        if ((P == X) && ((Q+1) == Y)) {goto End;}

         if ((S.A[P+1][Q] == 5) && ((P+1) <= 4)) {S.O[P+1][Q] = Heuristic((P+1),Q,  X, Y);}
        if (((P+1) == X) && (Q == Y)) {goto End;}




                for ( x = 0;x<MapX; x++){
                for( y = 0; y<MapY; y++){
                    if (S.O[x][y] == Min2(*S.O, (MapX*MapY))){
                        //cout<<Min2(*S.O, 30)<<endl;
                        P = x;
                        Q = y;
                        S.A[P][Q] = 4;
//                        ob[P][Q].a = 4;
                        //cout<<P<<Q<<endl



                   goto Start;
                    }
                  }
                }


End:
int b;


F[7][7] = S.A[7][7];

return F[7][7];



//Inisialisasi iterator ke list.begin




}

