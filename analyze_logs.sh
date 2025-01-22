total_requests=$(wc -l < access.log)
echo "Общее количество запросов: $total_requests" > report.txt
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)
echo "Количество уникальных IP-адресов: $unique_ips" >> report.txt
echo "Количество запросов по методам:" >> report.txt
awk '{print $6}' access.log | sed 's/"//g' | sort | uniq -c | sort -nr >> report.txt
most_popular_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)
echo "Самый популярный URL: $most_popular_url" >> report.txt
echo "Отчет создан и сохранен в файл report.txt"
