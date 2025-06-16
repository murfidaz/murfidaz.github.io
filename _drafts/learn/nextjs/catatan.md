- Fallback pada Suspense di Server Component harap gunakan komponent yang ringan, misalnya isinya cuman animasi svg, atau skeleton loading dgn css

    - page.tsx
        ```
        import { Suspense } from "react";
        import { ClientComponent, LoadingTime } from "./client";

        export default function Home() {
        const data = getData();
            return (
                <div>
                <Suspense fallback={<LoadingTime />}>
                    <ClientComponent data={data} />
                </Suspense>
                </div>
            );
        }

        async function getData() {
            await new Promise((r) => setTimeout(r, 5000));
            return "ini adalah data";
        }

    - client.tsx
        ```
        "use client";

        import { use } from "react";

        export function ClientComponent(
            { data }: { data: Promise<string> }
        ) {
            const getData = use(data);
            return <div>{getData}</div>;
        }

        export function LoadingTime() {
        return (
            <div className="mx-auto w-full max-w-sm rounded-md border border-blue-300 p-4">
            <div className="flex animate-pulse space-x-4">
                <div className="size-10 rounded-full bg-gray-200"></div>
                <div className="flex-1 space-y-6 py-1">
                <div className="h-2 rounded bg-gray-200"></div>
                <div className="space-y-3">
                    <div className="grid grid-cols-3 gap-4">
                    <div className="col-span-2 h-2 rounded bg-gray-200"></div>
                    <div className="col-span-1 h-2 rounded bg-gray-200"></div>
                    </div>
                    <div className="h-2 rounded bg-gray-200"></div>
                </div>
                </div>
            </div>
            </div>
        );
        }

- gunakan search params untuk pencarian & pagination
    ```
    export default async function Page({
        searchParams,
    }: {
        searchParams: Promise<{ [key: string]: string | string[] | undefined }>
        }) {
        const { page = '1', sort = 'asc', query = '' } = await searchParams
        
        return (
            <div>
            <h1>Product Listing</h1>
            <p>Search query: {query}</p>
            <p>Current page: {page}</p>
            <p>Sort order: {sort}</p>
            </div>
        )
    }

- gunakan cache, sebagai contoh untuk mengecek user, cache ini berlaku hanya untuk 1 kali render saja, bayangkan misal halaman dashboard banyak function mengecek user berulang-ulang, jika kita cache maka pada halman itu cukup 1kali saya
    https://nextjs.org/docs/app/guides/authentication#creating-a-data-access-layer-dal
    ```
    import 'server-only'
 
    import { cookies } from 'next/headers'
    import { decrypt } from '@/app/lib/session'
    
    export const verifySession = cache(async () => {
        const cookie = (await cookies()).get('session')?.value
        const session = await decrypt(cookie)
        
        if (!session?.userId) {
            redirect('/login')
        }
        
        return { isAuth: true, userId: session.userId }
    })

- pada Layout.tsx jangan pernah ada fetch data di server side, tapi gunakan fetch dari client side

- ketika navigasi menggunakan Link dunakan link status
    https://nextjs.org/docs/app/getting-started/linking-and-navigating
    ```
    'use client'
 
    import { useLinkStatus } from 'next/link'
    
    export default function LoadingIndicator() {
        const { pending } = useLinkStatus()
        return pending ? (
            <div role="status" aria-label="Loading" className="spinner" />
        ) : null
    }

- ketika navigasi menggunakan router.push gunakan useTransition() bawaan react
    ```
    "use client";

    import { Button } from "@/components/ui/button";
    import { Form, FormField, FormItem } from "@/components/ui/form";
    import { Input } from "@/components/ui/input";
    import { usePathname, useRouter, useSearchParams } from "next/navigation";
    import { useTransition } from "react";
    import { useForm } from "react-hook-form";

    interface SearchForm {
    search: string;
    }
    export function SearchParamsComponent(params: { searchValue?: string }) {
    const form = useForm<SearchForm>({
        defaultValues: {
        search: params.searchValue || "",
        },
    });
    const router = useRouter();
    const pathname = usePathname();
    const searchParams = useSearchParams();
    const [isPending, startTransition] = useTransition();

    function search(formValue: SearchForm) {
        const query = new URLSearchParams(searchParams.toString());
        query.set("search", formValue.search);
        startTransition(() => {
        router.push(pathname + "?" + query);
        });
    }

    return (
        <Form {...form}>
        <form onSubmit={form.handleSubmit(search)} className="flex gap-2">
            <FormField
            control={form.control}
            name="search"
            render={({ field }) => (
                <FormItem>
                <Input {...field} disabled={isPending} />
                </FormItem>
            )}
            />
            <Button type="submit" disabled={isPending}>
            Search
            </Button>
        </form>
        </Form>
    );
    }



- contoh koding navigasi hook - Global Naviation
    ```
    // lib/navigation.ts
    'use client';

    import { atom, useAtom, useSetAtom } from 'jotai';
    import { useTransition, useEffect } from 'react';
    import { useRouter } from 'next/navigation';

    export const isNavigatingAtom = atom(false);

    export function useNavigate() {
    const router = useRouter();
    const [isPending, startTransition] = useTransition();
    const [isNavigating, setIsNavigating] = useAtom(isNavigatingAtom);

    useEffect(() => {
        setIsNavigating(isPending);
    }, [isPending, setIsNavigating]);

    const navigate = (path: string) => {
        startTransition(() => {
        router.push(path);
        });
    };

    return { navigate, isNavigating };
    }
