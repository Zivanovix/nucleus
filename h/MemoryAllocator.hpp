
#ifndef MEMORYALLOCATOR_HPP
#define MEMORYALLOCATOR_HPP

#include "../lib/hw.h"


const uint32 CHUNK_MAGIC_FREE = 0xFABFAB00;
const uint32 CHUNK_MAGIC_USED = 0xDEADBEEF;

typedef struct ChunkHeader {
    uint32 magicNum;
    uint32 size; //size does not include the header itself, just the chunk

    ChunkHeader* nextFree;
    ChunkHeader* prevFree;
} ChunkHeader;

const size_t HEADER_SIZE_BYTES = sizeof(ChunkHeader);
const size_t HEADER_SIZE_BLOCKS = (HEADER_SIZE_BYTES + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;

class MemoryAllocator{

public:
    static MemoryAllocator* Instance();
    void* kmemAlloc(size_t size);
    int kmemFree(void* mem);

protected:
    MemoryAllocator();
    int tryMerge(ChunkHeader* left, ChunkHeader* right);
    static size_t bytesToBlocksCeil(size_t numBytes);
    static size_t bytesToBlocksFloor(size_t numBytes);
    static size_t blocksToBytes(size_t numBlocks);
    void* countChunkStartAddr(ChunkHeader* ch);
private:
    ChunkHeader* freeChunks;


};
#endif //MEMORYALLOCATOR_H
