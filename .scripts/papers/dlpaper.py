import requests
import argparse
import PyPDF2
from io import BytesIO

def download_and_parse_pdf(url):
    # Download the PDF file
    response = requests.get(url)
    response.raise_for_status()  # Raises an HTTPError if the response status code is 4XX/5XX

    # Use BytesIO to open the PDF in memory
    with BytesIO(response.content) as f:
        # Initialize a PDF reader object
        reader = PyPDF2.PdfReader(f)
        
        # Read and print the text from each page
        title = ""
        page = reader.pages[0]
        text = page.extract_text()
        ltext = text.split("\n")
        print("possible titles found via automatic parsing")
        print('1: "' +  ltext[0] + '"')
        print('2: "' +  ltext[1] + '"')
        print('3: "' +  ltext[2] + '"')
        print('4: "' +  ltext[3] + '"')
        print('5: "' +  ltext[4] + '"')
        print()
        print("do any of these work for the title? Can select multiple, i.e. '12'. If not just type the title.")
        ui = input() 
        if len(ui) <= 5:
            uil = list(ui)
            for i in uil:
                title += ltext[int(i)-1]
                if not i == uil[len(uil)-1] : title += " "

        else:
            title = ui

    # Save the PDF file locally
    with open("/home/synchronous/papers/"+str(title)+".pdf", "wb") as f:
        f.write(response.content)
    print("PDF file has been downloaded and saved as '"+str(title)+".pdf'.")

# Example usage
url = "https://arxiv.org/pdf/1706.03762.pdf"


def main():
    parser = argparse.ArgumentParser(description='Download paper from the internet.')
    parser.add_argument('url', help='The URL of the paper.')
    # parser.add_argument('-p', '--path', help='The path where the PDF should be saved. Defaults to the current directory.')

    args = parser.parse_args()
    download_and_parse_pdf(args.url)

if __name__ == "__main__":
    main()
