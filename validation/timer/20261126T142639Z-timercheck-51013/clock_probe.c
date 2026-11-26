#include <mach/mach_time.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>
int main(void) {
 mach_timebase_info_data_t tb;
 if (mach_timebase_info(&tb)!=KERN_SUCCESS || !tb.numer || !tb.denom) return 2;
 uint64_t first=mach_absolute_time(), prev=first, min_delta=UINT64_MAX;
 unsigned backwards=0, positive=0;
 for (unsigned i=0;i<1000000;i++) { uint64_t now=mach_absolute_time(); if(now<prev) backwards++; if(now>prev){uint64_t d=now-prev;if(d<min_delta)min_delta=d;positive++;} prev=now; }
 struct timespec a,b,delay={0,20000000};
 clock_gettime(CLOCK_MONOTONIC,&a); uint64_t m0=mach_absolute_time(); nanosleep(&delay,0); uint64_t m1=mach_absolute_time(); clock_gettime(CLOCK_MONOTONIC,&b);
 uint64_t md=(m1-m0)*tb.numer/tb.denom;
 uint64_t cd=(uint64_t)(b.tv_sec-a.tv_sec)*1000000000ULL+(uint64_t)(b.tv_nsec-a.tv_nsec);
 printf("timebase_numer=%u\\ntimebase_denom=%u\\nbackwards=%u\\npositive_steps=%u\\nmin_tick_delta=%llu\\nmach_elapsed_ns=%llu\\nclock_gettime_elapsed_ns=%llu\\n",tb.numer,tb.denom,backwards,positive,(unsigned long long)min_delta,(unsigned long long)md,(unsigned long long)cd);
 return backwards || !positive || !md || !cd || (md>cd?md-cd:cd-md)>cd/20;
}