<?php

namespace App\Fogger\Data\Mongo;

use App\Fogger\Recipe\Mongo\Collection;

class ChunkMessage
{
    const DEFAULT_CHUNK_SIZE = 2000;

    private $source;

    private $target;

    private $suffix;

    private $collection;

    private $keys;

    public function __construct(string $source, string $target, string $suffix, Collection $collection, array $keys)
    {
        $this->source = $source;
        $this->target = $target;
        $this->suffix = $suffix;
        $this->collection = $collection;
        $this->keys = $keys;
    }

    public function getSource(): string
    {
        return $this->source;
    }

    public function getTarget(): string
    {
        return $this->target;
    }

    public function getSuffix(): string
    {
        return $this->suffix;
    }

    public function getCollection(): Collection
    {
        return $this->collection;
    }

    public function getKeys(): array
    {
        return $this->keys;
    }
}
