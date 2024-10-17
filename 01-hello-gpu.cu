#include <stdio.h>

void helloCPU()
{
  printf("Hello from the CPU.\n");
}

/*
 * Refactor the `helloGPU` definition to be a kernel
 * that can be launched on the GPU. Update its message
 * to read "Hello from the GPU!"
 * R: I should use __global__ and when I call this function I should pass the execution
 */

__global__ void helloGPU()
{
  printf("Hello also from the CPU.\n");
}

int main()
{

  helloCPU();

  /*
   * Refactor this call to `helloGPU` so that it launches
   * as a kernel on the GPU.
   * functionName<<number_of_block, number_of_threads>>  -> helloGPU<<1,1>> is 1 block 1 thread this mean
   */

  helloGPU<<<1,1>>>();
  cudaDeviceSynchronize();

  /*
   * Add code below to synchronize on the completion of the
   * `helloGPU` kernel completion before continuing the CPU
   * thread.
   */
}
