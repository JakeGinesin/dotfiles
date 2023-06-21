#!/usr/bin/env python
import requests
from bs4 import BeautifulSoup
import os
import argparse

def download_paper(url, path=None):
    if path is None:
        path = os.getcwd()

    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')

    # Get the paper title and first author's last name
    title = soup.find('h1', {'class': 'title mathjax'}).text.split(':')[-1].strip()
    first_author_last_name = soup.find('div', {'class': 'authors'}).find('a').text.split()[-1]

    # Get the PDF url and download the PDF
    pdf_url = url.replace('/abs/', '/pdf/') + ".pdf"
    response = requests.get(pdf_url)

    # Create the filename and ensure it's valid
    filename = f"{title} - {first_author_last_name}.pdf"
    filename = "".join(i for i in filename if i not in "\/:*?<>|")  # Remove illegal characters

    # Create the full file path
    full_path = os.path.join(path, filename)

    # Save the PDF
    with open(full_path, 'wb') as f:
        f.write(response.content)
    print(f'Paper "{title}" downloaded successfully at "{full_path}"!')

def main():
    parser = argparse.ArgumentParser(description='Download paper from arXiv.')
    parser.add_argument('url', help='The URL of the arXiv paper.')
    parser.add_argument('-p', '--path', help='The path where the PDF should be saved. Defaults to the current directory.')

    args = parser.parse_args()

    download_paper(args.url, args.path)

if __name__ == "__main__":
    main()
