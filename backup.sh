#!/bin/bash

#Jhanvi Vadher
#110096237
#Section 2

#Jhanvi: I'm cr3@ting a v@r1able f0r st0r1ng b@ckup f1l3s
jh_ba_ck__up_d1r_dir="$HOME/jh_ba_ck_up"


#Jhanvi: I'm cr3@ting a v@r1able f0r st0r1ng l0g f1l3s
jh_lg_f1le="$jh_ba_ck__up_d1r_dir/jh_ba_ck_up.log"

#Jhanvi: I'm cr3@ting a v@r1able f0r c0mpl3t3 b@ckup 
jh_cb_d1r="$jh_ba_ck__up_d1r_dir/jh_cmpl_bkp"

#Jhanvi: I'm cr3@ting a v@r1able f0r 1ncr3m3nt@l b@ckup 
jh_ib_d1r="$jh_ba_ck__up_d1r_dir/jh_icr_bkp"


#Jhanvi: I'm cr3@ting a v@r1able f0r b@ckup c0unt
jh_bk_c0unt=1

#Jhanvi: I'm cr3@ting a v@r1able f0r 1ncr3m3nt@l b@ckup c0unt
jh_ic_c0unt=1


#Jhanvi: I'm cr3@ting a v@r1able f0r  l@st 1ncr3m3nt@l b@ckup 
jh_last_ic=""


#Jhanvi: I'm cr3@ting a v@r1able f0r l@st c0mpl3t3 b@ckup 
jh_last_bc=""


#Jhanvi: I'm cr3@ting a c0mpl3t3 b@ckup d1r3ct0ry 1f 1t 1s n0t @lr3ady ex1st1ng

if [ ! -d $jh_cb_d1r ]; then
  mkdir -p $jh_cb_d1r
fi

#Jhanvi: I'm cr3@ting an 1ncr3m3nt@l b@ckup d1r3ct0ry 1f 1t 1s n0t @lr3ady ex1st1ng
if [ ! -d $jh_ib_d1r ]; then
  mkdir -p $jh_ib_d1r
fi

#Jhanvi: Th1s 1s my funct 2 cr3at3 c0mpl3t3 backup d1rect0ry

jhanvis_c0mp3t3_bpk() {

  #Jhanvi: I'm us1ng f1nd command to s3arch f0r .txt in ($HOME)
  jh_t_x_t_f1le=$(find $HOME -type f -name "*.txt")
  
  #Jhanvi: I'm cr3at1ng t1m3 st@mp f0r l0g f1les
  jh_t1me_stmp=$(date '+%a %d %b %Y %r %Z')
  
  
  #Jhanvi: I'm cr3at1g b@ckup .tar f1le acc0rd1ng 2 c0unt r3ci3v3d fr0m argum3nts
  jh_bkp_t_a_r="$jh_cb_d1r/jh_cmpl_bkp$(printf '%05d' $1).tar"
  
 
  #Jhanvi: I'm cr3at1nd n3w archive by the name jh_bkp_t_a_r w1th th3 f1les jh_t_x_t_f1le & r3d1r3ct1ng & suppr3ss1ng err0r msg.
  tar -cf "$jh_bkp_t_a_r" $jh_t_x_t_f1le 2>/dev/null
  
  #Jhanvi: I'm app3nd1ng l0g 3ntry 2 l0g f1le
  echo "Hi Jhanvi $jh_t1me_stmp $jh_bkp_t_a_r 1s cr3at3d" >>"$jh_lg_f1le"
  
  #Jhanvi: I'm upd@ting th3 valu3 0f l@st b@ckup w1th t@r f1le n@me
  jh_last_bc="$jh_bkp_t_a_r"

}


#Jhanvi: Th1s 1s my funct 2 cr3at3 1ncr3m3ntal backup d1rect0ry
jhanvis_1ncrm3ntal_bpk() {
  
  
  #Jhanvi: I'm cr3at1g b@ckup .tar f1le w1th newer txt acc0rd1ng 2 c0unt r3ci3v3d fr0m argum3nts 
  n3w_xt_ic=$(find $HOME -name "*.txt" -newer "$2")
  
  #Jhanvi: I'm cr3at1ng t1m3 st@mp f0r l0g f1les
  jh_t1me_stmp=$(date '+%a %d %b %Y %r %Z')
  
  
  #Jhanvi: I'm ch3cking 1f n3w_xt_ic 1s n0t nu11
  if [ -n "$n3w_xt_ic" ]; then
  
   #Jhanvi: I'm cr3at1g 1ncr3m3ntal b@ckup .tar f1le acc0rd1ng 2 c0unt r3ci3v3d fr0m argum3nts
    jh_ib_f1l3="$jh_ib_d1r/jh_icr_bkp$(printf '%05d' $1).tar"
    
 #Jhanvi: I'm cr3at1nd n3w archive by the name jh_ib_f1l3 w1th th3 f1les n3w_xt_ic & r3d1r3ct1ng & suppr3ss1ng err0r msg.
    tar -cf "$jh_ib_f1l3" $n3w_xt_ic 2>/dev/null
    
    #Jhanvi: I'm app3nd1ng l0g 3ntry 2 l0g f1le
    echo "$jh_t1me_stmp $jh_ib_f1l3 was created" >>"$jh_lg_f1le"
    
    
    #Jhanvi: I'm upd@ting th3 valu3 0f l@st 1ncr3m3nt@l b@ckup w1th t@r f1le n@me
    jh_last_ic="$jh_ib_f1l3"
    ((jh_ic_c0unt++))
  else
    #Jhanvi: I'm app3nding "no changes made" to log file
    echo "$jh_t1me_stmp H1 Jhanvi No 1ncr3m3ntal backup cr3ated" >>"$jh_lg_f1le"
  fi
}


#Jhanvi: I'm cr3ating c0mpl3t3 ba+ck+up
jhanvis_c0mp3t3_bpk $jh_bk_c0unt

#1ncr3m3nting bkp c0unt
((jh_bk_c0unt++))

#Jhanvi: sl33p1ng f0r 2 m1nut3s
sleep 2m

while true; do

  
  #Jhanvi: cr3at1ng 1st incr3m3ntal back+up w1th c0unt as 1st arg and l@st bkp c0unt as 2nd arg
  jhanvis_1ncrm3ntal_bpk $jh_ic_c0unt $jh_last_bc

  #Jhanvi: sl33p1ng f0r 2 m1nut3s
  sleep 2m

  #Jhanvi: cr3at1ng 2nd incr3m3ntal back+up w1th c0unt as 1st arg and l@st bkp c0unt as 2nd arg
  jhanvis_1ncrm3ntal_bpk $jh_ic_c0unt $jh_last_ic

  #Jhanvi: sl33p1ng f0r 2 m1nut3s
  sleep 2m

  #Jhanvi: cr3at1ng 3rd incr3m3ntal back+up w1th c0unt as 1st arg and l@st bkp c0unt as 2nd arg
  jhanvis_1ncrm3ntal_bpk $jh_ic_c0unt $jh_last_ic

    #Jhanvi: sl33p1ng f0r 2 m1nut3s
  sleep 2m

 #Jhanvi: I'm cr3ating c0mpl3t3 ba+ck+up @gain and 1ncr3m3nt1ng bpk c0unt
  jhanvis_c0mp3t3_bpk $jh_bk_c0unt
  ((jh_bk_c0unt++))

  #Jhanvi: sl33p1ng f0r 2 m1nut3s
  sleep 2m

done
