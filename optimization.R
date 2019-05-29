A=data.frame(read.csv(file.choose(),header=T))
B=data.frame(A[1:123,c(1,2,3,4,5,6,7,8)])

D1=which(B[,5]>B[,3])
D0=which(B[,5]<B[,3])
D111=which(B[,5]>B[,3] & B[,4]>B[,5] & B[,4]>B[,3])
D101=which(B[,5]>B[,3] & B[,4]<B[,5] & B[,4]>B[,3])
D100=which(B[,5]>B[,3] & B[,4]<B[,5] & B[,4]<B[,3])
D011=which(B[,5]<B[,3] & B[,4]>B[,5] & B[,4]>B[,3])
D010=which(B[,5]<B[,3] & B[,4]>B[,5] & B[,4]<B[,3])
D000=which(B[,5]<B[,3] & B[,4]<B[,5] & B[,4]<B[,3])

f=function(a,b,c)
{
 if(a==1 & b==1 & c==1){
 D111
 }else if(a==1 & b==0 & c==1){
 D101
 }else if(a==1 & b==0 & c==0){
 D100
 }else if(a==0 & b==1 & c==1){
 D011
 }else if(a==0 & b==1 & c==0){
 D010
 }else if(a==0 & b==0 & c==0){
 D000
 } else {
 print("False Argument")
 }
}
B[f(1,1,1),c(1,2)]


##Code for 12:00-12:20 scheme##
D=data.frame(read.csv(file.choose(),header=T))
W=Pcl=Pcp=Ppp=Expcl=Expcp=Exppp=Expg=1:151
Rz=data.frame(W,Pcl,Pcp,Ppp,Expcl,Expcp,Exppp,Expg)
q=1
for(z in 757:907)
{
win=dt=Pr=Lfst=Hfst=Ln=Hn=Llst=Hlst=Lday=Hday=UM=LM=DlyM=AvM=Prop=1:6
R=data.frame(win,dt,Pr,Lfst,Hfst,Ln,Hn,Llst,Hlst,Lday,Hday,UM,LM,DlyM,AvM,Prop)
p=rep(0,3000)
m1=rep(0,3000)
m2=rep(0,3000)
m12=rep(0,3000)
k=1
for(j in 20180104:20180117)
{
 if(length(which(D[,2]==j))>1)
 {
  l1=D[which(D[,5]==556 & D[,2]==j),8]
  h1=D[which(D[,5]==556 & D[,2]==j),7]
  l=D[which(D[,5]==(z+1) & D[,2]==j),8]
  h=D[which(D[,5]==(z+1) & D[,2]==j),7]
  l2=D[which(D[,5]==(z+22) & D[,2]==j),8]
  h2=D[which(D[,5]==(z+22) & D[,2]==j),7]
  l4=D[which(D[,5]==556 & D[,2]==j),8]
  h4=D[which(D[,5]==556 & D[,2]==j),7]
  for(i in 556:z)
  {
   if(length(which(D[,5]==i & D[,2]==j))==1)
   {
    l1=min(l1,D[which(D[,5]==i & D[,2]==j),8])
    h1=max(h1,D[which(D[,5]==i & D[,2]==j),7]) 
   }
  }
  for(i in (z+1):(z+21))
  {
   if(length(which(D[,5]==i & D[,2]==j))==1)
   {
    l=min(l,D[which(D[,5]==i & D[,2]==j),8])
    h=max(h,D[which(D[,5]==i & D[,2]==j),7]) 
   }
  }
  for(i in (z+22):930)
  {
   if(length(which(D[,5]==i & D[,2]==j))==1)
   {
    l2=min(l2,D[which(D[,5]==i & D[,2]==j),8])
    h2=max(h2,D[which(D[,5]==i & D[,2]==j),7]) 
   }
  }
  for(i in 556:930)
  {
   if(length(which(D[,5]==i & D[,2]==j))==1)
   {
    l4=min(l4,D[which(D[,5]==i & D[,2]==j),8])
    h4=max(h4,D[which(D[,5]==i & D[,2]==j),7]) 
   }
  }
  if(l>h2){
  p[j]=0   
  m1[j]=(l-h2)/D[which(D[,5]==556 & D[,2]==j),6]
  m2[j]=(h-h2)/D[which(D[,5]==556 & D[,2]==j),6]
  m12[j]=mean(c(m1[j],m2[j]))
  } else if(l<=h2 & h>h2){
  p[j]=(length(which(D[which(D[,2]==j & D[,5]<=(z+21) & D[,5]>=(z+1)),7]<=h2)))/length(D[which(D[,2]==j & D[,5]<=(z+21) & D[,5]>=(z+1)),7])
  m1[j]=(h2-h)/D[which(D[,5]==556 & D[,2]==j),6]
  m2[j]=(h2-l)/D[which(D[,5]==556 & D[,2]==j),6]
  m12[j]=mean(c(m1[j],m2[j]))
  } else {
  p[j]=1
  m1[j]=(h2-h)/D[which(D[,5]==556 & D[,2]==j),6]
  m2[j]=(h2-l)/D[which(D[,5]==556 & D[,2]==j),6]
  m12[j]=mean(c(m1[j],m2[j]))
  }
  o=D[which(D[,5]==556 & D[,2]==j),6]
  R[k,1]=z
  R[k,2]=j  
  R[k,3]=p[j]                               #Probability of profitability#
  R[k,4]=l1
  R[k,5]=h1
  R[k,6]=l
  R[k,7]=h  
  R[k,8]=l2
  R[k,9]=h2
  R[k,10]=l4
  R[k,11]=h4
  R[k,12]=m1[j]*100                         #lower margin%:(min. p/l)/open#
  R[k,13]=m2[j]*100                         #upper margin%:(max. p/l)/open#
  R[k,14]=(((h4-l4)*100)/o)
  R[k,15]=m12[j]*100                        #avg margin%:mean(m1,m2)#
  R[k,16]=(R[k,15]/R[k,14])*100
  k=k+1
 }
}
T=6                                         #Total working days in a month#
cl=length(which(R[,3]==0))/T                #P[confirm loss in a month]#
cp=length(which(R[,3]==1))/T                #P[confirm profit in a month]#
pp=1-cl-cp                                  #P[probable profit in a month]#
Ecl=sum(R[which(R[,3]==0),15])             #Expected confirm loss%#
Ecp=sum(R[which(R[,3]==1),15])             #Expected confirm profit%#
Epp=sum(R[which(R[,3]>0 & R[,3]<1),3]*R[which(R[,3]>0 & R[,3]<1),15])
Eg=Ecp-Ecl+Epp
Rz[q,1]=z
Rz[q,2]=cl
Rz[q,3]=cp
Rz[q,4]=pp
Rz[q,5]=Ecl
Rz[q,6]=Ecp
Rz[q,7]=Epp
Rz[q,8]=Eg
q=q+1
}
Rz
plot(Rz123[,1],Rz123[,8])
Rz1=data.frame(Rz)
Rz2=data.frame(Rz)
Rz3=data.frame(Rz)
Rz123=rbind(Rz1,Rz2,Rz3)
Rzf=Rz123

save(Rzf,file="Numb.Rdata")

cat("\nLoss Confirm")
cat("\nProbable Profit")
cat("\nProfit Confirm")
cat("\nDate: ",j)
  cat("\nRange b/w  9:15-11:59: ",l1,h1)
  cat("\nRange b/w 12:00-12:20: ",l,h)
  cat("\nRange b/w  12:21-3:30: ",l2,h2)
  cat("\nDaily Low & Daily High: ",l4,h4)
  cat("\nProfit Probability: ",p[j])
  cat("\nDaily Range: ",(((h4-l4)*100)/o))
  cat("\nProfit Margin Range: ",(m1[j]*100),(m2[j]*100))
  cat("\nAverage margin: ",m12[j]*100)
  cat("\nOpen: ",o)

