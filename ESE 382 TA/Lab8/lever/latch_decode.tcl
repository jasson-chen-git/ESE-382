
########## Tcl recorder starts at 03/26/24 14:53:02 ##########

set version "2.1"
set proj_dir "D:/Lab8/lever"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../syn/rev_1/latch_decode.edf -jhd latch_decode.jhd -err automake.err -log latch_decode.log -prj latch_decode -lib \"$install_dir/ispcpld/dat/mach.edn\" @latch_decode.esp -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/26/24 14:53:02 ###########


########## Tcl recorder starts at 03/26/24 14:53:07 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../syn/rev_1/latch_decode.edf -out linedecoder.bl0 -err automake.err -log latch_decode.log -prj latch_decode -lib \"$install_dir/ispcpld/dat/mach.edn\" @latch_decode.esp -nbx -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" linedecoder.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"linedecoder.bl1\" -o \"latch_decode.bl2\" -omod \"latch_decode\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj latch_decode -lci latch_decode.lct -log latch_decode.imp -err automake.err -tti latch_decode.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci latch_decode.lct -blifopt  latch_decode.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" latch_decode.bl2 -sweep -mergefb -err automake.err -o latch_decode.bl3  @latch_decode.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci latch_decode.lct -dev mach4a -diofft  latch_decode.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" latch_decode.bl3 -pla -family AMDMACH -idev van -o latch_decode.tt2 -oxrf latch_decode.xrf -err automake.err  @latch_decode.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj latch_decode -dir $proj_dir -log latch_decode.log -tti latch_decode.tt2 -tto latch_decode.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci latch_decode.lct -dev mach4a -prefit  latch_decode.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp latch_decode.tt3 -out latch_decode.tt4 -err automake.err -log latch_decode.log -percent latch_decode.tte -mod linedecoder  @latch_decode.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" latch_decode.tte -o latch_decode.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci latch_decode.lct -out latch_decode.vct -log latch_decode.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open latch_decode.rsp w} rspFile] {
	puts stderr "Cannot create response file latch_decode.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"latch_decode.tt4\" -vci \"latch_decode.vct\" -log \"latch_decode.log\" -eqn \"latch_decode.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@latch_decode.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete latch_decode.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci latch_decode.vco -out latch_decode.lco -log latch_decode.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj latch_decode -if latch_decode.jed -j2s -log latch_decode.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/26/24 14:53:07 ###########


########## Tcl recorder starts at 03/26/24 14:53:42 ##########

# Commands to make the Process: 
# Stamp Model Data File
if [runCmd "\"$cpld_bin/lci2vci\" -vci latch_decode.vco -out latch_decode.lco -log latch_decode.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj latch_decode -if latch_decode.jed -j2s -log latch_decode.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/timer\" -inp \"latch_decode.tte\" -lci \"latch_decode.lct\" -stamp \"latch_decode.trp\" -exf \"linedecoder.exf\" -lco \"latch_decode.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/stamppar\" -i latch_decode.trp "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/26/24 14:53:42 ###########


########## Tcl recorder starts at 03/26/24 14:54:23 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open latch_decode.rss w} rspFile] {
	puts stderr "Cannot create response file latch_decode.rss: $rspFile"
} else {
	puts $rspFile "-i \"latch_decode.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"latch_decode.tte\" -lci \"latch_decode.lct\" -prj \"latch_decode\" -dir \"$proj_dir\" -err automake.err -log \"latch_decode.nrp\" -exf \"linedecoder.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@latch_decode.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete latch_decode.rss

########## Tcl recorder end at 03/26/24 14:54:24 ###########

