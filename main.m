#import <Foundation/Foundation.h>
#include <stdio.h>

int main (int argc, const char * argv[]) 
  {

  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	  NSFileManager *filemanager= [[NSFileManager alloc] init];
	  
	  NSString *filepath;
	  NSDictionary *attributes; 
	  
	  if(argc!=3) 
		{
		  printf("Usage: FileDP [-f/-d] [Full path to file/directory] \n");
		  return 0;
		}	  
	  
	  else 
		{
	
			if(strcmp(argv[1],"-f")==0)
				{		  
					filepath=[NSString stringWithCString:argv[2] encoding:NSASCIIStringEncoding];  
					if([filemanager fileExistsAtPath:filepath]==YES){
					attributes=[filemanager attributesOfItemAtPath:filepath error:NULL];	  
						NSLog(@"prot type is %@", [attributes objectForKey:NSFileProtectionKey]);}
					else {
					printf("File Not Found \n");
					}
				}
			else
				{
					NSString *dirpath=[NSString stringWithCString:argv[2] encoding:NSASCIIStringEncoding];
					
					if([dirpath hasSuffix:@"/"]==FALSE) {
						dirpath=[dirpath stringByAppendingFormat:@"/"];
					}
					if([filemanager fileExistsAtPath:dirpath]==YES){
						
						   
					NSDirectoryEnumerator *direnum=[filemanager enumeratorAtPath:dirpath];
					
					for(NSString *f in direnum){
												 
						filepath=[dirpath stringByAppendingFormat:f];
						attributes=[filemanager attributesOfItemAtPath:filepath error:NULL];	
						NSLog(@"file name is:%@ - protection class:%@", filepath,[attributes objectForKey:NSFileProtectionKey]);
						
					
						}
					}
					else {
						printf("Directory Not found \n");
					}
					
				}
		}
	
  [pool drain];
   return 0;

 }
