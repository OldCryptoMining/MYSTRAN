! ##################################################################################################################################
 
      SUBROUTINE CC_ACCE ( CARD )
 
! Processes Case Control ACCE cards
 
      USE PENTIUM_II_KIND, ONLY       :  BYTE, LONG, DOUBLE
      USE IOUNT1, ONLY                :  WRT_LOG, F04
      USE SCONTR, ONLY                :  BLNK_SUB_NAM, LSUB, NSUB 
      USE TIMDAT, ONLY                :  TSEC
      USE SUBR_BEGEND_LEVELS, ONLY    :  CC_ACCE_BEGEND
      USE MODEL_STUF, ONLY            :  SC_ACCE
 
      USE CC_ACCE_USE_IFs

      IMPLICIT NONE
 
      CHARACTER(LEN=LEN(BLNK_SUB_NAM)):: SUBR_NAME = 'CC_ACCE'
      CHARACTER(LEN=*), INTENT(IN)    :: CARD              ! A Bulk Data card
 
      INTEGER(LONG)                   :: I                 ! DO loop index
      INTEGER(LONG)                   :: SETID             ! Set ID on this Case Control card
      INTEGER(LONG), PARAMETER        :: SUBR_BEGEND = CC_ACCE_BEGEND
 
! **********************************************************************************************************************************
      IF (WRT_LOG >= SUBR_BEGEND) THEN
         CALL OURTIM
         WRITE(F04,9001) SUBR_NAME,TSEC
 9001    FORMAT(1X,A,' BEGN ',F10.3)
      ENDIF

! **********************************************************************************************************************************
! CC_OUTPUTS processes all output type Case Control entries (they all have some common code so it is put there)

      CALL CC_OUTPUTS ( CARD, 'ACCE', SETID )

! Set CASE CONTROL output request variable to SETID
 
      IF (NSUB == 0) THEN
         DO I = 1,LSUB
            SC_ACCE(I) = SETID
         ENDDO   
      ELSE
         SC_ACCE(NSUB) = SETID
      ENDIF
 
! **********************************************************************************************************************************
      IF (WRT_LOG >= SUBR_BEGEND) THEN
         CALL OURTIM
         WRITE(F04,9002) SUBR_NAME,TSEC
 9002    FORMAT(1X,A,' END  ',F10.3)
      ENDIF

      RETURN

! **********************************************************************************************************************************
 
      END SUBROUTINE CC_ACCE 
