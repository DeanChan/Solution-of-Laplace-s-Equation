%A toy demo with a 21*21 meshgrid
u=zeros(21, 21);
h=0.1;
u(1,:)=100;     %boundary voltage
u(21,:)=100;
u(:,1)=100;
u(:,21)=100;

for i=2:5
   for j=2:10
       a=u(i,j);
       b=u(i,j+1);
       c=u(i+1,j);
       d=u(i,j-1);
       e=u(i-1,j);
       f=0.25*(b+c+d+e);
       
       u(i,j)=f;

   end
end

u(2:5,12:20)=fliplr(u(2:5,2:10));
u(17:20,2:20)=flipud(u(2:5,2:20));
u(6:16,2:5)=fliplr(rot90(u(2:5,6:16),-1));
u(6:16,17:20)=rot90(u(2:5,6:16),-1);
u(11,2:5)=0.5*(u(10,2:5)+u(12,2:5));   u(11,17:20)=0.5*(u(10,17:20)+u(12,17:20));
u(2:5,11)=0.5*(u(2:5,10)+u(2:5,12));   u(17:20,11)=0.5*(u(17:20,10)+u(17:20,12));

surf(u);
