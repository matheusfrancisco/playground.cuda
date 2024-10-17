#include <stdio.h>

/*
 * Refactor `loop` to be a CUDA Kernel. The new kernel should
 * only do the work of 1 iteration of the original loop.
 */

__global__ void loop(int N)
{
  for (int i = 0; i < N; ++i)
  {
    printf("This is iteration number %d\n", i);
  }
}

__global__ void loop2(int N)
{
    
    
  int i = threadIdx.x + blockIdx.x * blockDim.x;
//this will print 1 time for each thread so it will print 9 times 0 + 0 * 0 = 0
// 1 + 0 * 0 = 1
// 2
  printf("This is iteration in parallel: %d\n", i);
  
}

__global__ void loop_for_single_block(int N)
{
    
    
  int i = threadIdx.x;
//this will print 1 time for each thread so it will print 9 times 0 + 0 * 0 = 0
// 1 + 0 * 0 = 1
// 2
  printf("This is iteration in parallel: %d\n", i);
  
}
int main()
{
  /*
   * When refactoring `loop` to launch as a kernel, be sure
   * to use the execution configuration to control how many
   * "iterations" to perform.
   *
   * For this exercise, only use 1 block of threads.
   */

  int N = 10;
  //loop<<<1,9>>>(N);
    
  loop2<<<1,9>>>(N);
  cudaDeviceSynchronize();
}
