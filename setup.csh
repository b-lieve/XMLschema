if ( ! ${?NS_JDK150_11} ) then

	setenv NS_JDK150_11 1
	setenv JAVA_HOME /usr/usc/jdk/1.5.0_11
	setenv PATH /usr/usc/jdk/1.5.0_11/bin:$PATH

	if ( ! ${?MANPATH} ) then
		setenv MANPATH /usr/usc/jdk/1.5.0_11/man:/usr/man:/usr/openwin/man:/usr/share/man:/usr/usc/man
	else
		setenv MANPATH /usr/usc/jdk/1.5.0_11/man:$MANPATH
	endif

endif

