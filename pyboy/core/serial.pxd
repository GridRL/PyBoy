#
# License: See LICENSE.md file
# GitHub: https://github.com/Baekalfen/PyBoy
#

cimport cython
from libc.stdint cimport uint8_t,int64_t

from pyboy.logging.logging cimport Logger


cdef Logger logger

cdef class Serial:
    @cython.locals(data=uint8_t[:])
    cdef bint tick(self, int64_t) noexcept #nogil
    cdef int64_t cycles_to_transmit(self) noexcept nogil
    cdef void stop(self) noexcept
    
    cdef uint8_t SB
    cdef uint8_t SC
    cdef int64_t trans_bits
    cdef int64_t cycles_count
    cdef int64_t cycles_target
    cdef bint serial_interrupt_based
    cdef object connection
    cdef object binding_connection
