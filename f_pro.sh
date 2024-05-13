#!/bin/bash

declare -A CHR_info
info_file="CHR_info.txt"

load_previous1_info() {
    if [[ -f "$info_file" ]]; then
        while read -r line; do
            CHR_status=$(echo "$line" | cut -d ':' -f1)
            CHR_info["$CHR_status"]=1
        done < "$info_file"
    fi
}

save_current1_info() {
    > "$info_file"
    for CHR_status in "${!p_info[@]}"; do
        echo "$CHR_status:${CHR_info[$CHR_status]}" >> "$info_file"
    done
}

get_chrom_running_time() {
    # Check if Microsoft Word is running
    if cmd.exe /c tasklist 2>/dev/null | grep chrome.exe > /dev/null; then
        # Check if Word is already marked as running
        if [[ "${CHR_info["running"]}" != 1 ]]; then
            # Get the start time of Microsoft Word
            start_time=$(wsl.exe --exec ps -eo lstart,cmd | grep chrome.exe | awk '{print $1, $2, $3, $4, $5}')

            # Convert the start time to a human-readable format
            start_time_human=$(date -d "$start_time" +"%Y-%m-%d %H:%M:%S")

            start_seconds=$(date -u -d "$start_time_human" +"%s")



   echo "--------------------------------------"
            echo " Chrome Start Time: $start_time_human"
            echo "--------------------------------------"


            # Mark Word as running
            CHR_info["running"]=1
        fi
    else     current_t=$(date +"%Y-%m-%d %H:%M:%S")
            current_s=$(date -u -d "$current_t" +"%s")
        # Check if Word is already marked as not running
        if [[ "${CHR_info["running"]}" == 1 ]]; then
            # Output the stop message
            echo "== == == == == == == == == == == = "
            echo " Chrome  stopped Time:$current_t"
           echo "== == == == == == == == == == == ==  "
           running_seconds=$((current_s - start_seconds))
          running_time=$(date -u -d @"$running_seconds" +"%T")
          echo "Chrome Running Time :$running_time"
            echo "== == == == == == == == == == == =="

            # Mark Word as not running
            CHR_info["running"]=0
        fi
    fi
}



declare -A word_info
info_filee="word_info.txt"

load_previous2_info() {
    if [[ -f "$info_filee" ]]; then
        while read -r line; do
            word_status=$(echo "$line" | cut -d ':' -f1)
            word_info["$word_status"]=1
        done < "$info_filee"
    fi
}

save_current2_info() {
    > "$info_filee"
    for word_status in "${!word_info[@]}"; do
        echo "$word_status:${word_info[$word_status]}" >> "$info_filee"
    done
}

get_word_running_time() {
    # Check if Microsoft Word is running
    if cmd.exe /c tasklist 2>/dev/null | grep WINWORD.EXE > /dev/null; then
        # Check if Word is already marked as running
        if [[ "${word_info["running"]}" != 1 ]]; then
            # Get the start time of Microsoft Word
            start_time=$(wsl.exe --exec ps -eo lstart,cmd | grep WINWORD.EXE | awk '{print $1, $2, $3, $4, $5}')

            # Convert the start time to a human-readable format
            start_time_human=$(date -d "$start_time" +"%Y-%m-%d %H:%M:%S")

            start_seconds=$(date -u -d "$start_time_human" +"%s")


         # Output the start time
            echo "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
            echo "Microsoft Word Start Time: $start_time_human"
            echo "--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -"


              
            # Mark Word as running
            word_info["running"]=1
        fi
    else
           current_t=$(date +"%Y-%m-%d %H:%M:%S")
            current_s=$(date -u -d "$current_t" +"%s")
        # Check if Word is already marked as not running
        if [[ "${word_info["running"]}" == 1 ]]; then
            # Output the stop message

            echo "Microsoft Word  stopped Time:$current_t"
            echo "== == == == == == == == == == == == =="
             running_seconds=$((current_s - start_seconds))
          running_time=$(date -u -d @"$running_seconds" +"%T")
          echo " Microsoft Word Runing Time:$running_time"
            echo "== == == == == == == == == == == == =="

            # Mark Word as not running
            word_info["running"]=0
        fi
    fi
}


declare -A EXE_info
info_file="EXE_info.txt"

load_previous3_info() {
    if [[ -f "$info_file" ]]; then
        while read -r line; do
            EXE_status=$(echo "$line" | cut -d ':' -f1)
            EXE_info["$EXE_status"]=1
        done < "$info_file"
    fi
}

save_current3_info() {
    > "$info_file"
    for EXE_status in "${!p_info[@]}"; do
        echo "$EXE_status:${EXE_info[$EXE_status]}" >> "$info_file"
    done
}

get_EXC_running_time() {
    # Check if Microsoft Word is running
    if cmd.exe /c tasklist 2>/dev/null | grep EXCEL.EXE > /dev/null; then
        # Check if Word is already marked as running
        if [[ "${EXE_info["running"]}" != 1 ]]; then
            # Get the start time of Microsoft Word
            start_time=$(wsl.exe --exec ps -eo lstart,cmd | grep EXCEL.EXE | awk '{print $1, $2, $3, $4, $5}')

            # Convert the start time to a human-readable format
            start_time_human=$(date -d "$start_time" +"%Y-%m-%d %H:%M:%S")

            start_seconds=$(date -u -d "$start_time_human" +"%s")




            # Output the start time
            echo "*********************************************"

           echo "Microsoft Excel Start Time: $start_time_human"
            echo "**********************************************"



            # Mark Word as running
            EXE_info["running"]=1
        fi
    else

          current_t=$(date +"%Y-%m-%d %H:%M:%S")
            current_s=$(date -u -d "$current_t" +"%s")


        # Check if Word is already marked as not running
        if [[ "${EXE_info["running"]}" == 1 ]]; then
            # Output the stop message



            echo "Microsoft Excel  stopped Time:$current_t"
            echo "***********************************************"
          running_seconds=$((current_s - start_seconds))
          running_time=$(date -u -d @"$running_seconds" +"%T")
          echo " Microsoft Excel Runnign Time :$running_time"
            echo "****************************************"

            # Mark Word as not running
            EXE_info["running"]=0
        fi
    fi
}


     declare -A pow_info
inf_file="pow_info.txt"

load_previous4_info() {
    if [[ -f "$inf_file" ]]; then
        while read -r line; do
            pow_status=$(echo "$line" | cut -d ':' -f1)
            pow_info["$pow_status"]=1
        done < "$inf_file"
    fi
}

save_current4_info() {
    > "$inf_file"
    for pow_status in "${!pow_info[@]}"; do
        echo "$word_status:${pow_info[$pow_status]}" >> "$inf_file"
    done
}

get_pow_running_time() {
    # Check if Microsoft Word is running
    if cmd.exe /c tasklist 2>/dev/null | grep POWERPNT.EXE > /dev/null; then
        # Check if Word is already marked as running
        if [[ "${pow_info["running"]}" != 1 ]]; then
            # Get the start time of Microsoft Word
            start_time=$(wsl.exe --exec ps -eo lstart,cmd | grep POWERPNT.EXE | awk '{print $1, $2, $3, $4, $5}')

            # Convert the start time to a human-readable format
            start_time_human=$(date -d "$start_time" +"%Y-%m-%d %H:%M:%S")

            start_seconds=$(date -u -d "$start_time_human" +"%s")




            # Output the start time
            echo "**************************************************"
            echo "Microsoft Powerpoint Start Time: $start_time_human"
            echo "***************************************************"
               # Mark Word as running
            pow_info["running"]=1
        fi
    else     current_t=$(date +"%Y-%m-%d %H:%M:%S")
            current_s=$(date -u -d "$current_t" +"%s")
        # Check if Word is already marked as not running
        if [[ "${pow_info["running"]}" == 1 ]]; then
            # Output the stop message

            echo "Microsoft Powerpoint  stopped Time :$current_t."
            echo "*********************************************"
             running_seconds=$((current_s - start_seconds))
            running_time=$(date -u -d @"$running_seconds" +"%T")
            echo " Microsoft Powerpoint Running Time:$running_time"
            echo "************************************************"

            # Mark Word as not running
            pow_info["running"]=0
        fi
    fi
}
    

declare -A ZAP_info
info_fil="ZAP_info.txt"

load_previous5_info() {
    if [[ -f "$info_file" ]]; then
        while read -r line; do
            ZAP_status=$(echo "$line" | cut -d ':' -f1)
            ZAP_info["$ZAP_status"]=1
        done < "$info_fil"
    fi
}

save_current5_info() {
    > "$info_fil"
    for ZAP_status in "${!ZAP_info[@]}"; do
        echo "$ZAP_status:${ZAP_info[$ZAP_status]}" >> "$info_fil"
    done
}

get_ZAPya_running_time() {
    # Check if Microsoft Word is running
    if cmd.exe /c tasklist 2>/dev/null | grep Zapya.exe > /dev/null; then
        # Check if Word is already marked as running
        if [[ "${ZAP_info["running"]}" != 1 ]]; then
            # Get the start time of Microsoft Word
            start_time=$(wsl.exe --exec ps -eo lstart,cmd | grep Zapya.exe | awk '{print $1, $2, $3, $4, $5}')

            # Convert the start time to a human-readable format
            start_time_human=$(date -d "$start_time" +"%Y-%m-%d %H:%M:%S")

            start_seconds=$(date -u -d "$start_time_human" +"%s")

            echo "*************************************************"
            echo "Zapya Start Time: $start_time_human"
            echo "*************************************************"

         # Mark Word as running
            ZAP_info["running"]=1
        fi
    else
            current_t=$(date +"%Y-%m-%d %H:%M:%S")
            current_s=$(date -u -d "$current_t" +"%s")
        # Check if Word is already marked as not running
        if [[ "${ZAP_info["running"]}" == 1 ]]; then
            # Output the stop message

            echo "Zapya stopped Time:$current_t"
            echo "*******************************************"
           running_seconds=$((current_s - start_seconds))
           running_time=$(date -u -d @"$running_seconds" +"%T")
            echo " The Zapya Runing Time:$running_time"
            echo "*******************************************"

            # Mark Word as not running
            ZAP_info["running"]=0
        fi
    fi
}
main() {
    load_previous1_info

    load_previous2_info

    load_previous3_info

    load_previous4_info

    load_previous5_info
    while true; do
     get_chrom_running_time
     save_current1_info

     get_word_running_time
     save_current2_info

     get_EXC_running_time
     save_current3_info

     get_pow_running_time
     save_current4_info

     get_ZAPya_running_time
     save_current5_info
        sleep 4
    done
}

main

