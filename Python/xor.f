c     ##################################################################
c     THIS FILE IS AUTOMATICALLY GENERATED WITH:
c     
c     ffnet-0.8.3, feed-forward neural network for python
c     http://ffnet.sourceforge.net
c     
c     Copyright (C) 2006 by Marek Wojciechowski
c     <mwojc@p.lodz.pl>
c     
c     Distributed under the terms of the GNU General Public License:
c     http://www.gnu.org/copyleft/gpl.html
c     ##################################################################
c     
c     NETWORK SPECIFICATION
c     Feed-forward neural network: 
c     inputs:     2 
c     hiddens:    2 
c     outputs:    1 
c     connections and biases:    9
c     
c     INPUT LIMITS
c           1 --> [ 0.  1.]
c           2 --> [ 0.  1.]
c     
c     OUTPUT LIMITS
c           1 --> [ 0.  1.]
c     
c     NOTE: You need 'ffnet.f' file distributed with ffnet-0.8.3
c           sources to get the below routines to work.
c      
c     ------------------------------------------------------------------
      SUBROUTINE ffnet(input, output)
c     ------------------------------------------------------------------
c     
c     Calculates network answer to given input.
c     
c     :Parameters:
c     inp : array
c     2D array of input patterns (or 1D for single pattern)
c     
c     :Returns:
c     ans : array
c     1D or 2D array of calculated network outputs
c     
c     :Raises:
c     TypeError
c     If *inp* is invalid
c     Arguments:
c     input - 1-d array of length 2
c     output - 1-d array of length 1
c     ------------------------------------------------------------------
      INTEGER conec(9, 2)
      INTEGER inno(2)
      INTEGER outno(1)
      DOUBLE PRECISION weights(9)
      DOUBLE PRECISION eni(2, 2)
      DOUBLE PRECISION deo(1, 2)
      DOUBLE PRECISION units(5)
      DOUBLE PRECISION input(2)
      DOUBLE PRECISION output(1)
c      
cf2py intent(in) input
cf2py intent(out) output
c      
      conec(1, 1) = 0
      conec(2, 1) = 1
      conec(3, 1) = 2
      conec(4, 1) = 0
      conec(5, 1) = 1
      conec(6, 1) = 2
      conec(7, 1) = 0
      conec(8, 1) = 3
      conec(9, 1) = 4
      conec(1, 2) = 3
      conec(2, 2) = 3
      conec(3, 2) = 3
      conec(4, 2) = 4
      conec(5, 2) = 4
      conec(6, 2) = 4
      conec(7, 2) = 5
      conec(8, 2) = 5
      conec(9, 2) = 5
c      
      inno(1) = 2
      inno(2) = 1
c      
      outno(1) = 5
c      
      weights(1) = -2.040761901685660d+01
      weights(2) = -7.938872733929276d+00
      weights(3) = +2.335176960381941d+01
      weights(4) = +4.749104170748084d+00
      weights(5) = -1.818713714930297d+01
      weights(6) = +2.196201291022087d+01
      weights(7) = -1.736668633656911d+00
      weights(8) = -2.353692010578280d+01
      weights(9) = +3.488290221939068d+00
c      
      eni(1, 1) = +7.000000000000000d-01
      eni(2, 1) = +7.000000000000000d-01
      eni(1, 2) = +1.500000000000000d-01
      eni(2, 2) = +1.500000000000000d-01
c      
      deo(1, 1) = +1.428571428571429d+00
      deo(1, 2) = -2.142857142857143d-01
c      
      CALL normcall( weights, conec, 9, units, 5, 
     & inno, 2, outno, 1, eni, deo, input, output )
c      
      END
c      
c     ------------------------------------------------------------------
      SUBROUTINE dffnet(input, deriv)
c     ------------------------------------------------------------------
c     
c     Returns partial derivatives of the network's output vs its input.
c     
c     For each input pattern an array of the form::
c     
c     | o1/i1, o1/i2, ..., o1/in |
c     | o2/i1, o2/i2, ..., o2/in |
c     | ...                      |
c     | om/i1, om/i2, ..., om/in |
c     
c     is returned.
c     
c     :Parameters:
c     inp : array
c     2D array of input patterns (or 1D for single pattern)
c     
c     :Returns:
c     ans : array
c     1D or 2D array of calculated network outputs
c     
c     :Examples:
c     >>> from ffnet import mlgraph, ffnet
c     >>> conec = mlgraph((3,3,2))
c     >>> net = ffnet(conec); net.weights[:] = 1.
c     >>> net.derivative([0., 0., 0.])
c     array([[ 0.02233658,  0.02233658,  0.02233658],
c     [ 0.02233658,  0.02233658,  0.02233658]])
c     Arguments:
c     input - 1-d array of length 2
c     deriv - 2-d array of the shape (1, 2)
c     ------------------------------------------------------------------
      INTEGER conec(9, 2)
      INTEGER dconecno(8)
      INTEGER dconecmk(3)
      INTEGER inno(2)
      INTEGER outno(1)
      DOUBLE PRECISION weights(9)
      DOUBLE PRECISION eni(2, 2)
      DOUBLE PRECISION ded(1, 2)
      DOUBLE PRECISION units(5)
      DOUBLE PRECISION input(2)
      DOUBLE PRECISION deriv(1, 2)
c      
cf2py intent(in) input
cf2py intent(out) deriv
c      
      conec(1, 1) = 0
      conec(2, 1) = 1
      conec(3, 1) = 2
      conec(4, 1) = 0
      conec(5, 1) = 1
      conec(6, 1) = 2
      conec(7, 1) = 0
      conec(8, 1) = 3
      conec(9, 1) = 4
      conec(1, 2) = 3
      conec(2, 2) = 3
      conec(3, 2) = 3
      conec(4, 2) = 4
      conec(5, 2) = 4
      conec(6, 2) = 4
      conec(7, 2) = 5
      conec(8, 2) = 5
      conec(9, 2) = 5
c      
      dconecno(1) = 3
      dconecno(2) = 6
      dconecno(3) = 8
      dconecno(4) = 9
      dconecno(5) = 2
      dconecno(6) = 5
      dconecno(7) = 8
      dconecno(8) = 9
c      
      dconecmk(1) = 0
      dconecmk(2) = 4
      dconecmk(3) = 8
c      
      inno(1) = 2
      inno(2) = 1
c      
      outno(1) = 5
c      
      weights(1) = -2.040761901685660d+01
      weights(2) = -7.938872733929276d+00
      weights(3) = +2.335176960381941d+01
      weights(4) = +4.749104170748084d+00
      weights(5) = -1.818713714930297d+01
      weights(6) = +2.196201291022087d+01
      weights(7) = -1.736668633656911d+00
      weights(8) = -2.353692010578280d+01
      weights(9) = +3.488290221939068d+00
c      
      eni(1, 1) = +7.000000000000000d-01
      eni(2, 1) = +7.000000000000000d-01
      eni(1, 2) = +1.500000000000000d-01
      eni(2, 2) = +1.500000000000000d-01
c      
      ded(1, 1) = +1.000000000000000d+00
      ded(1, 2) = +1.000000000000000d+00
c      
      CALL normdiff( weights, conec, 9, dconecno, 8, 
     & dconecmk, units, 5, inno, 2, outno, 1, 
     & eni, ded, input, deriv)
c      
      END
