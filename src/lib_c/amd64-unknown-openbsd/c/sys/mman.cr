require "./types"

lib LibC

  fun mmap(x0 : Void*, x1 : SizeT, x2 : Int, x3 : Int, x4 : Int, x5 : OffT) : Void*
  fun mprotect(x0 : Void*, x1 : SizeT, x2 : Int) : Int
  fun munmap(x0 : Void*, x1 : SizeT) : Int
  fun madvise(x0 : Void*, x1 : SizeT, x2 : Int) : Int
  # Protections are chosen from these bits, or-ed together
  PROT_NONE   = 0x00  # no permissions
  PROT_READ   = 0x01  # pages can be read
  PROT_WRITE  = 0x02  # pages can be written
  PROT_EXEC   = 0x04  # pages can be executed

  #Sharing types
  MAP_SHARED    = 0x0001    # share changes
  MAP_PRIVATE   = 0x0002    # changes are private
  MAP_FIXED     = 0x0010    # map addr must be exactly as requested
  MAP_ANON      = 0x1000    # allocated from memory, swap space
  MAP_ANONYMOUS = MAP_ANON  # alternate POSIX spelling

  MAP_FAILED    = Pointer(Void).new(-1)

  # POSIX memory advisory values
  POSIX_MADV_NORMAL     = 0  # no further special treatment
  POSIX_MADV_RANDOM     = 1  # expect random page references
  POSIX_MADV_SEQUENTIAL = 2  # expect sequential page references
  POSIX_MADV_WILLNEED   = 3  # will need these pages
  POSIX_MADV_DONTNEED   = 4  # don't need these pages

  # Original advice values
  MADV_NORMAL     = POSIX_MADV_NORMAL
  MADV_RANDOM     = POSIX_MADV_RANDOM
  MADV_SEQUENTIAL = POSIX_MADV_SEQUENTIAL
  MADV_WILLNEED   = POSIX_MADV_WILLNEED
  MADV_DONTNEED   = POSIX_MADV_DONTNEED
  MADV_SPACEAVAIL = 5  # insure that resources are reserved
  MADV_FREE       = 6  # pages are empty, free them

end
